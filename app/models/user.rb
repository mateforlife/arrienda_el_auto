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
  validates :rut, presence: true

  validates_presence_of %i[first_name last_name second_last_name rut birthdate
                           gender phone_number]
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

  REQUIRED_DOCUMENTS = %w[identity criminal_record].freeze

  def driver_accounts
    DriverAccount
  end

  def full_name
    "#{first_name} #{last_name} #{second_last_name}"
  end

  private

  def validate_age
    if birthdate.present? && birthdate > 18.years.ago.to_date
      errors.add(:birthdate, 'debes ser mayor de 18 años.')
    end
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
