# frozen_string_literal: true

class MyVehiclesController < ApplicationController
  def index
    @vehicles = current_user.vehicles
  end
end
