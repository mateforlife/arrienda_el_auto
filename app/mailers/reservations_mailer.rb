# frozen_string_literal: true

# ReservationsMailer
class ReservationsMailer < ApplicationMailer
  layout 'bootstrap-mailer'
  def created_for_owner(owner, vehicle, reservation)
    @owner = owner
    @vehicle = vehicle
    @reservation = reservation

    make_bootstrap_mail(to: @owner.email, subject: 'Tu vehiculo ha sido reservado')
  end

  def created_for_driver(driver, vehicle, reservation)
    @driver = driver
    @vehicle = vehicle
    @reservation = reservation

    make_bootstrap_mail(to: @driver.email, subject: 'Has reservado un vehiculo')
  end
end
