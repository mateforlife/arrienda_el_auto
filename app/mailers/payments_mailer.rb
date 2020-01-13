# frozen_string_literal: true

# PaymentsMailer
class PaymentsMailer < ApplicationMailer
  before_action :set_admin_emails
  def notify_create_to_admin(payment_id, reservation_id, reservation)
    @payment_id = payment_id
    @reservation_id = reservation_id
    @reservation = reservation
    mail to: @admin_emails, subject: 'Usuario ha realizado un pago!'
  end

  def payment_success(to, reservation)
    @reservation = reservation
    mail to: to, cco: @admin_emails, subject: 'Tu pago ha sido validado'
  end

  def payment_rejected(to, reservation)
    @reservation = reservation
    mail to: to, cco: @admin_emails, subject: 'Tu pago ha sido rechazado'
  end
end
