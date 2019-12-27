# frozen_string_literal: true

# Payment
class Payment < ApplicationRecord
  belongs_to :reservation
  has_one_attached :file
  enum status: %i[pending approved rejected]

  ALLOWED_FILE_TYPES = ['image/png', 'image/jpg', 'image/jpeg',
                        'application/pdf'].freeze

  validates :file, presence: true
  validates :file, attached: true, content_type: ALLOWED_FILE_TYPES
  before_create :set_amount

  def calculated_amount
    days = (reservation.end_date - reservation.start_date).to_i + 1
    fee_amount * days
  end

  private

  def set_amount
    self.amount = calculated_amount
  end

  def fee_amount
    reservation.vehicle.fee.amount
  end
end
