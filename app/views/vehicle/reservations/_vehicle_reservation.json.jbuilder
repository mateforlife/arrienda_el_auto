json.extract! vehicle_reservation, :id, :user_id, :vehicle_id, :start_date, :end_date, :deleted_at, :status, :created_at, :updated_at
json.url vehicle_reservation_url(vehicle_reservation, format: :json)
