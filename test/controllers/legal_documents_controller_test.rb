require 'test_helper'

class LegalDocumentsControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
    @legal_document = legal_documents(:one)
  end

  test "should get index" do
    get :index, params: { vehicle_id: @vehicle }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { vehicle_id: @vehicle }
    assert_response :success
  end

  test "should create legal_document" do
    assert_difference('LegalDocument.count') do
      post :create, params: { vehicle_id: @vehicle, legal_document: @legal_document.attributes }
    end

    assert_redirected_to vehicle_legal_document_path(@vehicle, LegalDocument.last)
  end

  test "should show legal_document" do
    get :show, params: { vehicle_id: @vehicle, id: @legal_document }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { vehicle_id: @vehicle, id: @legal_document }
    assert_response :success
  end

  test "should update legal_document" do
    put :update, params: { vehicle_id: @vehicle, id: @legal_document, legal_document: @legal_document.attributes }
    assert_redirected_to vehicle_legal_document_path(@vehicle, LegalDocument.last)
  end

  test "should destroy legal_document" do
    assert_difference('LegalDocument.count', -1) do
      delete :destroy, params: { vehicle_id: @vehicle, id: @legal_document }
    end

    assert_redirected_to vehicle_legal_documents_path(@vehicle)
  end
end
