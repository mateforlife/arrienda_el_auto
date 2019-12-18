class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  enum status: %i[reserved current finished]

  validates_presence_of %i[start_date end_date]
  validate :consistent_dates

  scope :current_and_future, lambda {
    where(status: %w[reserved current]).order('end_date DESC')
  }

  private

  def consistent_dates
    return true if start_date <= end_date

    errors.add('intervalo de fechas inconsistente')
  end
end
