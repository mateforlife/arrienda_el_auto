class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  belongs_to :user
  belongs_to :fee

  enum body_type: %i[citycar sedan]
  enum engine_type: %i[gasoline diesel]
  enum transmission: %i[manual automatic]
  validate_presence_of %i[year licence_plate engine_number chasis_number]
end
