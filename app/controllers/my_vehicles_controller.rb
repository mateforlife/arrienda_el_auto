# frozen_string_literal: true

# MyVehiclesController
class MyVehiclesController < ApplicationController
  def index
    @vehicles = current_user.vehicles.eager_load(images_attachments: :blob)
  end
end
