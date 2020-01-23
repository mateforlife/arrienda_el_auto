# frozen_string_literal: true

# User
class User < ApplicationRecord
  include Documentable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :vehicles
  has_many :reservations
  has_one :driver_account
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true,
                                          reject_if: :address_invalid?
  has_one :bank_account, dependent: :destroy
  accepts_nested_attributes_for :bank_account, allow_destroy: true,
                                               reject_if: :bank_account_invalid?

  REQUIRED_DOCUMENTS = %w[identity criminal_record].freeze

  validates_presence_of %i[first_name last_name second_last_name rut birthdate
                           gender phone_number]
  validates :rut, presence: true
  validates :rut, uniqueness: true, if: proc { |usr| usr.rut.present? }
  validates :rut, format: { with: /\A\d{1,3}(\.\d{3})*-[0-9K]\z/,
                            message: 'Formato inválido' },
                  if: proc { |usr| usr.rut.present? }
  validate :validate_age

  enum permission: %i[basic admin]
  enum gender: %i[male female]
  translate_enum :gender

  before_save :sanitize_email
  before_save :trim_and_capitalize_names

  scope :admins, -> { where(permission: 'admin') }

  def driver_accounts
    DriverAccount
  end

  def full_name
    "#{first_name} #{last_name} #{second_last_name}"
  end

  def update(params, *options)
    ActiveRecord::Base.transaction do
      create_or_update_address!(params)
      create_or_update_bank_account!(params)
    rescue ActiveRecord::RecordInvalid => e
      errors.add(:base, e)
      raise ActiveRecord::Rollback
    end
    super(params, *options)
  end

  private

  def create_or_update_bank_account!(params)
    if bank_account
      bank_account.update!(params['bank_account_attributes'])
    else
      acc = BankAccount.new(params['bank_account_attributes'])
      acc.user = self
      acc.save!
    end
  end

  def create_or_update_address!(params)
    if address
      address.update!(params['address_attributes'])
    else
      adr = Address.new(params['address_attributes'])
      adr.user = self
      adr.save!
    end
  end

  def bank_account_invalid?(attributes)
    attributes['user_id'] = id
    acc = BankAccount.new(attributes)
    acc.valid?
  end

  def address_invalid?(attributes)
    attributes['user_id'] = id
    adr = Address.new(attributes)
    adr.valid?
  end

  def validate_age
    return unless birthdate.present? && birthdate > 18.years.ago.to_date

    errors.add(:birthdate, 'debes ser mayor de 18 años.')
  end

  def sanitize_email
    self.email = email.downcase if email?
  end

  def trim_and_capitalize_names
    %i[first_name last_name second_last_name].each do |attribute|
      if self[attribute].present?
        self[attribute] = self[attribute].downcase.strip.titleize
      end
    end
  end
end
