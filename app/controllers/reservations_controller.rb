# frozen_string_literal: true

# ReservationsController
class ReservationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_vehicle
  before_action :set_reservation, only: [:show, :edit, :update]
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
    authorize! :create, @reservation
  end

  # GET vehicles/1/reservations/1/edit
  def edit
    return if @reservation.waiting_payment?

    redirect_to my_reservations_path, alert: 'No se puede editar'
  end

  # POST vehicles/1/reservations
  def create
    @reservation = @vehicle.reservations.build(reservation_params)

    if @reservation.save
      redirect_to new_reservation_payment_path(@reservation,
                                               notice: 'Reservation was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT vehicles/1/reservations/1
  def update
    if @reservation.update(reservation_params)
      redirect_to([@reservation.vehicle, @reservation],
                  notice: 'Reservation was successfully updated.')
    else
      render action: 'edit'
    end
  end

  def destroy
    respond_to do |format|
      if @reservation.destroy
        format.html { redirect_to [@reservation.vehicle, @reservation], notice: 'reservation was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to my_reservations_path, alert: 'no se puede eliminar' }
      end
    end
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
    params[:reservation]['user_id'] = current_user.id
    params.require(:reservation).permit(:user_id, :start_date,
                                        :end_date)
  end
end
