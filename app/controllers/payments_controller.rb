# frozen_string_literal: true

# PaymentsController
class PaymentsController < ApplicationController
  include FilesHelper
  load_and_authorize_resource
  before_action :set_reservation
  before_action :set_payment, only: [:show, :edit, :update]

  # GET reservations/1/payments
  def index
    @payments = @reservation.payments
  end

  # GET reservations/1/payments/1
  def show
  end

  # GET reservations/1/payments/new
  def new
    @payment = @reservation.payments.build
  end

  # GET reservations/1/payments/1/edit
  def edit
  end

  # POST reservations/1/payments
  def create
    debugger
    @payment = @reservation.payments.build(payment_params)
    if @payment.save
      redirect_to([@payment.reservation, @payment],
                  notice: 'Espera a que validemos tu pago, serás notificado
                           via email')
    else
      render action: 'new'
    end
  end

  # PUT reservations/1/payments/1
  def update
    if @payment.update(payment_params)
      redirect_to([@payment.reservation, @payment],
                  notice: 'Payment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def set_payment
    @payment = @reservation.payments.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def payment_params
    params.require(:payment).permit(:file, :status)
  end
end
