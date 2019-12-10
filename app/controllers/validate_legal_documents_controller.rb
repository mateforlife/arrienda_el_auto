class ValidateLegalDocumentsController < ApplicationController
  include ValidateLegalDocumentsHelper
  before_action :set_resource
  before_action :set_path

  def index
    @resources = @resource.pending_document_validation
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    return @resource = User if params[:resource] == 'users'

    @resource = Vehicle
  end
end
