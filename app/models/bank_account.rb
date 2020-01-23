# frozen_string_literal: true

# BankAccount
class BankAccount < ApplicationRecord
  belongs_to :bank
  belongs_to :user

  enum account_type: %i[corriente vista ahorro]
  validates_presence_of %i[name rut account_number account_type email]
  validates :rut, format: { with: /\A\d{1,3}(\.\d{3})*-[0-9K]\z/,
                            message: 'Formato inválido' },
                  if: proc { |usr| usr.rut.present? }

  before_save :trim_and_capitalize_name
  before_save :sanitize_email

  private

  def sanitize_email
    self.email = email.downcase if email?
  end

  def trim_and_capitalize_name
    self.name = name.downcase.strip.titleize
  end
end
