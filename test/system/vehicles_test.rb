require "application_system_test_case"

class VehiclesTest < ApplicationSystemTestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "visiting the index" do
    visit vehicles_url
    assert_selector "h1", text: "Vehicles"
  end

  test "creating a Vehicle" do
    visit vehicles_url
    click_on "New Vehicle"

    check "Air conditioning" if @vehicle.air_conditioning
    fill_in "Airbags quantity", with: @vehicle.airbags_quantity
    fill_in "Body type", with: @vehicle.body_type
    fill_in "Chasis number", with: @vehicle.chasis_number
    fill_in "Comment", with: @vehicle.comment
    fill_in "Deleted at", with: @vehicle.deleted_at
    fill_in "Direction", with: @vehicle.direction
    fill_in "Door quantity", with: @vehicle.door_quantity
    fill_in "Engine type", with: @vehicle.engine_type
    fill_in "Fee", with: @vehicle.fee_id
    fill_in "Licence plate", with: @vehicle.licence_plate
    fill_in "Ngine number", with: @vehicle.engine_number
    fill_in "Odometer", with: @vehicle.odometer
    fill_in "Passenger capacity", with: @vehicle.passenger_capacity
    fill_in "Traction", with: @vehicle.traction
    fill_in "Transmission", with: @vehicle.transmission
    fill_in "User", with: @vehicle.user_id
    fill_in "Vehicle model", with: @vehicle.vehicle_model_id
    check "Visible" if @vehicle.visible
    fill_in "Year", with: @vehicle.year
    click_on "Create Vehicle"

    assert_text "Vehicle was successfully created"
    click_on "Back"
  end

  test "updating a Vehicle" do
    visit vehicles_url
    click_on "Edit", match: :first

    check "Air conditioning" if @vehicle.air_conditioning
    fill_in "Airbags quantity", with: @vehicle.airbags_quantity
    fill_in "Body type", with: @vehicle.body_type
    fill_in "Chasis number", with: @vehicle.chasis_number
    fill_in "Comment", with: @vehicle.comment
    fill_in "Deleted at", with: @vehicle.deleted_at
    fill_in "Direction", with: @vehicle.direction
    fill_in "Door quantity", with: @vehicle.door_quantity
    fill_in "Engine type", with: @vehicle.engine_type
    fill_in "Fee", with: @vehicle.fee_id
    fill_in "Licence plate", with: @vehicle.licence_plate
    fill_in "Ngine number", with: @vehicle.engine_number
    fill_in "Odometer", with: @vehicle.odometer
    fill_in "Passenger capacity", with: @vehicle.passenger_capacity
    fill_in "Traction", with: @vehicle.traction
    fill_in "Transmission", with: @vehicle.transmission
    fill_in "User", with: @vehicle.user_id
    fill_in "Vehicle model", with: @vehicle.vehicle_model_id
    check "Visible" if @vehicle.visible
    fill_in "Year", with: @vehicle.year
    click_on "Update Vehicle"

    assert_text "Vehicle was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicle" do
    visit vehicles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicle was successfully destroyed"
  end
end
