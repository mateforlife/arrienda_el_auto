# frozen_string_literal: true

# ValidateLegalDocumentsController
class ValidateLegalDocumentsController < ApplicationController
  def index
    @vehicles = Vehicle.pending_document_validation
    @users = User.pending_document_validation
    @drivers = DriverAccount.pending_document_validation
  end
end
