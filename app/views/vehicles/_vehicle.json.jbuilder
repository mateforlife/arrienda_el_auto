json.extract! vehicle, :id, :vehicle_model_id, :year, :odometer, :user_id, :license_plate, :engine_number, :chasis_number, :transmission, :engine_type, :passenger_capacity, :air_conditioning, :airbags_quantity, :door_quantity, :drive, :steering, :body_type, :visible, :fee_id, :comment, :deleted_at, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
