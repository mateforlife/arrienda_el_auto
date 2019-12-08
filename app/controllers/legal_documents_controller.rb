class LegalDocumentsController < ApplicationController
  include LegalDocumentsHelper
  load_and_authorize_resource
  before_action :set_resource
  before_action :set_remaining_documents, only: %i[index new]
  before_action :set_legal_document, only: [:show, :edit, :update, :destroy]

  # GET vehicles/1/legal_documents
  def index
    @legal_documents = @resource.legal_documents
  end

  # GET vehicles/1/legal_documents/1
  def show
  end

  # GET vehicles/1/legal_documents/new
  def new
    if @remaining_documents.zero?
      redirect_to vehicle_legal_documents_url(@resource), notice: 'Ya has subido todos los documentos, espera a que los validemos'
    end
    @legal_document = @resource.legal_documents.build
  end

  # GET vehicles/1/legal_documents/1/edit
  def edit
  end

  # POST vehicles/1/legal_documents
  def create
    @legal_document = @resource.legal_documents.build(legal_document_params)

    if @legal_document.save_with_images
      redirect_to([@legal_document.resource, @legal_document], notice: 'Legal document was successfully created.')
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

    redirect_to vehicle_legal_documents_url(@resource)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    if params.include?('user_id')
      return @resource = User.find_by(id: params[:user_id])
    end

    @resource = Vehicle.find_by(id: params[:vehicle_id])
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
    params.require(:legal_document).permit(:document_type, :due_date, :status,
                                           attachments: [])
  end
end
