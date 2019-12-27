# frozen_string_literal: true

# Reservation
class Reservation < ApplicationRecord
  include Notificable
  belongs_to :user
  belongs_to :vehicle
  has_many :payments

  enum status: %i[reserved current finished rejected]

  validates_presence_of %i[start_date end_date]
  validate :consistent_dates
  validate :user_must_have_active_driver_account

  scope :current_and_future, lambda {
    where(status: %w[reserved current]).order('end_date DESC')
  }

  private

  def user_must_have_active_driver_account
    return if self.user&.driver_account&.approved?

    errors.add(:user_id, 'debe tener una cuenta de conductor,
               creala desde tu perfíl')
  end

  def consistent_dates
    return true if start_date <= end_date

    errors.add('intervalo de fechas inconsistente')
  end
end
