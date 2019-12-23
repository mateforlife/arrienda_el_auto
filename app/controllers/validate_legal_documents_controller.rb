class ValidateLegalDocumentsController < ApplicationController
  include ValidateLegalDocumentsHelper

  def index
    @vehicles = Vehicle.pending_document_validation
    @users = User.pending_document_validation
    @drivers = DriverAccount.pending_document_validation
  end
end
