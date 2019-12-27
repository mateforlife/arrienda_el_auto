require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
    @payment = payments(:one)
  end

  test "should get index" do
    get :index, params: { reservation_id: @reservation }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { reservation_id: @reservation }
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, params: { reservation_id: @reservation, payment: @payment.attributes }
    end

    assert_redirected_to reservation_payment_path(@reservation, Payment.last)
  end

  test "should show payment" do
    get :show, params: { reservation_id: @reservation, id: @payment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { reservation_id: @reservation, id: @payment }
    assert_response :success
  end

  test "should update payment" do
    put :update, params: { reservation_id: @reservation, id: @payment, payment: @payment.attributes }
    assert_redirected_to reservation_payment_path(@reservation, Payment.last)
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, params: { reservation_id: @reservation, id: @payment }
    end

    assert_redirected_to reservation_payments_path(@reservation)
  end
end
