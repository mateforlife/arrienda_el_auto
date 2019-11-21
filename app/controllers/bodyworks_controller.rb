class BodyworksController < ApplicationController
  before_action :set_bodywork, only: [:show, :edit, :update, :destroy]

  # GET /bodyworks
  # GET /bodyworks.json
  def index
    @bodyworks = Bodywork.all
  end

  # GET /bodyworks/1
  # GET /bodyworks/1.json
  def show
  end

  # GET /bodyworks/new
  def new
    @bodywork = Bodywork.new
  end

  # GET /bodyworks/1/edit
  def edit
  end

  # POST /bodyworks
  # POST /bodyworks.json
  def create
    @bodywork = Bodywork.new(bodywork_params)

    respond_to do |format|
      if @bodywork.save
        format.html { redirect_to @bodywork, notice: 'Bodywork was successfully created.' }
        format.json { render :show, status: :created, location: @bodywork }
      else
        format.html { render :new }
        format.json { render json: @bodywork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bodyworks/1
  # PATCH/PUT /bodyworks/1.json
  def update
    respond_to do |format|
      if @bodywork.update(bodywork_params)
        format.html { redirect_to @bodywork, notice: 'Bodywork was successfully updated.' }
        format.json { render :show, status: :ok, location: @bodywork }
      else
        format.html { render :edit }
        format.json { render json: @bodywork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bodyworks/1
  # DELETE /bodyworks/1.json
  def destroy
    @bodywork.destroy
    respond_to do |format|
      format.html { redirect_to bodyworks_url, notice: 'Bodywork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bodywork
      @bodywork = Bodywork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bodywork_params
      params.require(:bodywork).permit(:name)
    end
end
