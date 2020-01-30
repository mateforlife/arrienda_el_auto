# frozen_string_literal: true

# ReservationDeadlineWorker
class ReservationDeadlineWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'vehicles'

  def perform(vehicle_id, user_id)
    vehicle = Vehicle.find(vehicle_id)
    # user = User.find(user_id)
    return unless vehicle.temp_disabled?

    # user.log_out!
    raise StandardError unless vehicle.back_to_status
  end
end
