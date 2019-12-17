class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  enum status: %i[reserved current finished]

  scope :current_and_future, lambda {
    where(status: %w[reserved current]).order('end_date DESC')
  }
end
