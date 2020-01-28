# frozen_string_literal: true

# MyVehiclesReservationsController
class MyVehiclesReservationsController < ApplicationController
  def index
    @reservations = Reservation
                    .joins(:vehicle)
                    .where(vehicles: { user_id: current_user.id })
  end
end
