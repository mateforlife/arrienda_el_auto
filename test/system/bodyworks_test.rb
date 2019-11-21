require "application_system_test_case"

class BodyworksTest < ApplicationSystemTestCase
  setup do
    @bodywork = bodyworks(:one)
  end

  test "visiting the index" do
    visit bodyworks_url
    assert_selector "h1", text: "Bodyworks"
  end

  test "creating a Bodywork" do
    visit bodyworks_url
    click_on "New Bodywork"

    fill_in "Name", with: @bodywork.name
    click_on "Create Bodywork"

    assert_text "Bodywork was successfully created"
    click_on "Back"
  end

  test "updating a Bodywork" do
    visit bodyworks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bodywork.name
    click_on "Update Bodywork"

    assert_text "Bodywork was successfully updated"
    click_on "Back"
  end

  test "destroying a Bodywork" do
    visit bodyworks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bodywork was successfully destroyed"
  end
end
