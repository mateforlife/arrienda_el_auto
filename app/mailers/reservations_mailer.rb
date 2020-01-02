# frozen_string_literal: true

# ReservationsMailer
class ReservationsMailer < ApplicationMailer
  def created_for_owner(owner, vehicle, reservation)
    @owner = owner
    @vehicle = vehicle
    @reservation = reservation

    mail(to: @owner.email, subject: 'Tu vehiculo ha sido reservado') do |format|
      format.text
      format.mjml
    end
  end

  def created_for_driver(driver, vehicle, reservation)
    @driver = driver
    @vehicle = vehicle
    @reservation = reservation

    mail(to: @driver.email, subject: 'Has reservado un vehiculo') do |format|
      format.text
      format.mjml
    end
  end
end
