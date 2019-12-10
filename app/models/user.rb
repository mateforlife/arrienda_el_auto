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
  validates :rut, presence: true

  validates_presence_of %i[first_name last_name second_last_name rut birthdate
                           gender phone_number]
  validates :rut, uniqueness: true, if: proc { |usr| usr.rut.present? }
  validates :rut, format: { with: /\A\d{1,3}(\.\d{3})*-[0-9K]\z/,
                            message: 'Formato inválido' },
                  if: proc { |usr| usr.rut.present? }

  enum permission: %i[basic admin]
  enum gender: %i[male female]
  translate_enum :gender

  before_save :sanitize_email
  before_save :trim_and_capitalize_names

  REQUIRED_DOCUMENTS = %w[identity criminal_record].freeze
  DRIVER_REQUIRED_DOCUMENTS = %w[driver_license driver_resume].freeze

  def full_name
    "#{first_name} #{last_name} #{second_last_name}"
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
