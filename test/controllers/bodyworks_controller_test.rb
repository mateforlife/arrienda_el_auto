require 'test_helper'

class BodyworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bodywork = bodyworks(:one)
  end

  test "should get index" do
    get bodyworks_url
    assert_response :success
  end

  test "should get new" do
    get new_bodywork_url
    assert_response :success
  end

  test "should create bodywork" do
    assert_difference('Bodywork.count') do
      post bodyworks_url, params: { bodywork: { name: @bodywork.name } }
    end

    assert_redirected_to bodywork_url(Bodywork.last)
  end

  test "should show bodywork" do
    get bodywork_url(@bodywork)
    assert_response :success
  end

  test "should get edit" do
    get edit_bodywork_url(@bodywork)
    assert_response :success
  end

  test "should update bodywork" do
    patch bodywork_url(@bodywork), params: { bodywork: { name: @bodywork.name } }
    assert_redirected_to bodywork_url(@bodywork)
  end

  test "should destroy bodywork" do
    assert_difference('Bodywork.count', -1) do
      delete bodywork_url(@bodywork)
    end

    assert_redirected_to bodyworks_url
  end
end
