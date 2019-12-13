require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get vehicles_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_url
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post vehicles_url, params: { vehicle: { air_conditioning: @vehicle.air_conditioning, airbags_quantity: @vehicle.airbags_quantity, body_type: @vehicle.body_type, chasis_number: @vehicle.chasis_number, comment: @vehicle.comment, deleted_at: @vehicle.deleted_at, steering: @vehicle.steering, door_quantity: @vehicle.door_quantity, engine_type: @vehicle.engine_type, fee_id: @vehicle.fee_id, license_plate: @vehicle.license_plate, engine_number: @vehicle.engine_number, odometer: @vehicle.odometer, passenger_capacity: @vehicle.passenger_capacity, drive: @vehicle.drive, transmission: @vehicle.transmission, user_id: @vehicle.user_id, vehicle_model_id: @vehicle.vehicle_model_id, status: @vehicle.status, year: @vehicle.year } }
    end

    assert_redirected_to vehicle_url(Vehicle.last)
  end

  test "should show vehicle" do
    get vehicle_url(@vehicle)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_url(@vehicle)
    assert_response :success
  end

  test "should update vehicle" do
    patch vehicle_url(@vehicle), params: { vehicle: { air_conditioning: @vehicle.air_conditioning, airbags_quantity: @vehicle.airbags_quantity, body_type: @vehicle.body_type, chasis_number: @vehicle.chasis_number, comment: @vehicle.comment, deleted_at: @vehicle.deleted_at, steering: @vehicle.steering, door_quantity: @vehicle.door_quantity, engine_type: @vehicle.engine_type, fee_id: @vehicle.fee_id, license_plate: @vehicle.license_plate, engine_number: @vehicle.engine_number, odometer: @vehicle.odometer, passenger_capacity: @vehicle.passenger_capacity, drive: @vehicle.drive, transmission: @vehicle.transmission, user_id: @vehicle.user_id, vehicle_model_id: @vehicle.vehicle_model_id, status: @vehicle.status, year: @vehicle.year } }
    assert_redirected_to vehicle_url(@vehicle)
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete vehicle_url(@vehicle)
    end

    assert_redirected_to vehicles_url
  end
end
