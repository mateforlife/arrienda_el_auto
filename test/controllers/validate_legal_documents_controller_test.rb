require 'test_helper'

class ValidateLegalDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get validate_legal_documents_index_url
    assert_response :success
  end

end
