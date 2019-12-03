require 'test_helper'

class ProfileImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get profile_images_destroy_url
    assert_response :success
  end

end
