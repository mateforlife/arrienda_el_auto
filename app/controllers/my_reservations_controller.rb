# frozen_string_literal: true

# MyReservationsController
class MyReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.order(created_at: :desc)
  end
end
