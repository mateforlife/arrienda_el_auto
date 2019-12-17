class ReservationsController < ApplicationController
  before_action :set_vehicle
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_dates, only: %i[new create edit update]

  # GET vehicles/1/reservations
  def index
    @reservations = @vehicle.reservations
  end

  # GET vehicles/1/reservations/1
  def show
  end

  # GET vehicles/1/reservations/new
  def new
    @reservation = @vehicle.reservations.build
  end

  # GET vehicles/1/reservations/1/edit
  def edit
  end

  # POST vehicles/1/reservations
  def create
    @reservation = @vehicle.reservations.build(reservation_params)

    if @reservation.save
      redirect_to([@reservation.vehicle, @reservation], notice: 'Reservation was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT vehicles/1/reservations/1
  def update
    if @reservation.update_attributes(reservation_params)
      redirect_to([@reservation.vehicle, @reservation], notice: 'Reservation was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE vehicles/1/reservations/1
  def destroy
    @reservation.destroy

    redirect_to vehicle_reservations_url(@vehicle)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def set_reservation
    @reservation = @vehicle.reservations.find(params[:id])
  end

  def set_dates
    @start_date = @vehicle.reservation_start_date + 1.days
    @end_date = @start_date + 3.days
  end

  # Only allow a trusted parameter "white list" through.
  def reservation_params
    params.require(:reservation).permit(:user_id, :vehicle_id, :start_date, :end_date, :deleted_at, :status)
  end
end
