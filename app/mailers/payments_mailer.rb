# frozen_string_literal: true

# PaymentsMailer
class PaymentsMailer < ApplicationMailer
  def notify_create_to_admin(payment_id, reservation)
    @payment_id = payment_id
    @reservation = reservation
    mail to: @admin_emails, subject: 'Usuario ha realizado un pago!'
  end

  def payment_success(to, reservation)
    @reservation = reservation
    @vehicle_owner = reservation.vehicle.user
    mail to: to, cco: @admin_emails, subject: 'Tu pago ha sido validado'
  end

  def payment_success_owner(to, reservation)
    @reservation = reservation
    @vehicle_owner = reservation.vehicle.user
    mail to: to, cco: @admin_emails, subject: 'Se ha aprobado el pago de una
                                                reserva de tu vehículo'
  end

  def payment_rejected(to, reservation, payment_comment)
    @reservation = reservation
    @payment_comment = payment_comment
    mail to: to, cco: @admin_emails, subject: 'Tu pago ha sido rechazado'
  end

  def payment_rejected_owner(to, reservation)
    @reservation = reservation
    @vehicle_owner = reservation.vehicle.user
    mail to: to, cco: @admin_emails, subject: 'Se ha rechazado el pago de una
                                                reserva de tu vehículo'
  end
end
