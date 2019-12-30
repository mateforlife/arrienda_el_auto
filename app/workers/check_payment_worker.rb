# frozen_string_literal: true

# CheckPaymentWorker
class CheckPaymentWorker
  include Sidekiq::Worker

  def perform(reservation_id)
    reservation = Reservation.find(reservation_id)
    return if reservation.payment_effective?

    reservation.rejected!
  end
end
