class ValidateLegalDocumentsController < ApplicationController
  def index
    @vehicles = Vehicle.pending_document_validation
  end
end
