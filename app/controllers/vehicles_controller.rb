class VehiclesController < ApplicationController
  load_and_authorize_resource
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :set_brands, only: %i[edit new create update]
  before_action :validate_legal_documents, only: %i[new create]
  before_action :brand_select_option, only: %i[edit update]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.available
                       .not_from_current_user(current_user)
    render '_index'
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = current_user.vehicles.new(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def validate_legal_documents
    return if current_user.legal_documents_effective?

    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Debes validar tu documentacion legal antes de continuar.' }
      format.json { head :no_content }
    end
  end

  def brand_select_option
    @selected_option = @vehicle&.vehicle_model&.brand&.id
    @disabled = true
  end

  def set_brands
    @brands = Brand.preload(:vehicle_models).order(:name)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.require(:vehicle).permit(:vehicle_model_id, :year, :odometer,
                                    :license_plate, :engine_number, :drive,
                                    :chasis_number, :transmission, :engine_type,
                                    :passenger_capacity, :air_conditioning,
                                    :airbags_quantity, :door_quantity,
                                    :steering, :body_type, :comment, :status,
                                    images: [])
  end
end
