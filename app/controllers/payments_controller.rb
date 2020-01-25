# frozen_string_literal: true

# PaymentsController
class PaymentsController < ApplicationController
  include FilesHelper
  load_resource
  load_and_authorize_resource only: %i[update edit]
  before_action :set_reservation
  before_action :set_payment, only: [:show, :edit, :update]

  # GET reservations/1/payments
  def index
    @payments = @reservation.payments
    authorize! :read, @payments.first
  end

  # GET reservations/1/payments/1
  def show
    authorize! :read, @payment
  end

  # GET reservations/1/payments/new
  def new
    @payment = @reservation.payments.build
    authorize! :new, @payment
  end

  # GET reservations/1/payments/1/edit
  def edit
  end

  # POST reservations/1/payments
  def create
    @payment = @reservation.payments.build(payment_params)
    authorize! :create, @payment
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
                  notice: 'El pago ha sido actualizado exitosamente.')
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
    params.require(:payment).permit(:file, :status, :comment)
  end
end
