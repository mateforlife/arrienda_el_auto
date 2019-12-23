# frozen_string_literal: true

# LegalDocumentsController
class LegalDocumentsController < ApplicationController
  include LegalDocumentsHelper
  load_resource :user
  load_resource :vehicle
  load_resource :driver_account
  load_and_authorize_resource
  before_action :set_resource
  before_action :set_remaining_documents, only: %i[index new]
  before_action :set_legal_document, only: [:show, :edit, :update, :destroy]

  # GET vehicles/1/legal_documents
  def index
    @legal_documents = @resource.legal_documents
    authorize! :read, @resource
  end

  # GET vehicles/1/legal_documents/1
  def show
    authorize! :read, @legal_document
  end

  # GET vehicles/1/legal_documents/new
  def new
    if @remaining_documents.zero?
      redirect_to legal_documents_path(@resource), notice: 'Ya has subido todos los documentos, espera a que los validemos'
    end
    @legal_document = @resource.legal_documents.build
  end

  # GET vehicles/1/legal_documents/1/edit
  def edit
  end

  # POST vehicles/1/legal_documents
  def create
    @legal_document = @resource.legal_documents.build(legal_document_params)

    if @legal_document.save
      redirect_to([@legal_document.resource, @legal_document],
                  notice: 'Legal document was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT vehicles/1/legal_documents/1
  def update
    if @legal_document.update_attributes(legal_document_params)
      redirect_to([@legal_document.resource, @legal_document], notice: 'Legal document was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE vehicles/1/legal_documents/1
  def destroy
    @legal_document.destroy

    redirect_to legal_documents_path(@resource)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    if params.include?('driver_account_id')
      @resource = DriverAccount.find_by(id: params[:driver_account_id])
    elsif params.include?('vehicle_id')
      @resource = Vehicle.find_by(id: params[:vehicle_id])
    elsif params.include?('user_id')
      @resource = User.find_by(id: params[:user_id])
    end
  end

  def set_legal_document
    @legal_document = @resource.legal_documents.find(params[:id])
  end

  def set_remaining_documents
    return @remaining_documents = 0 if @resource.nil?

    @remaining_documents = @resource.remaining_documents&.count || 0
  end

  # Only allow a trusted parameter "white list" through.
  def legal_document_params
    if action_name == 'update'
      params[:legal_document]['validator_id'] = current_user.id
    end
    params.require(:legal_document).permit(:document_type, :due_date, :status,
                                           :validator_id, images: [])
  end
end
