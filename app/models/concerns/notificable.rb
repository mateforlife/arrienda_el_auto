# frozen_string_literal: true

# Notificable
module Notificable
  extend ActiveSupport::Concern

  included do
    after_update :check_ready_to_notify, if: :vehicle?
    after_create :notify_created_reservation, if: :reservation?
  end

  private

  def check_ready_to_notify
    notify_documents_effective if resource.legal_documents_effective?
  end

  def vehicle?
    self&.resource&.class&.to_s == 'Vehicle'
  end

  def reservation?
    self.class.to_s == 'Reservation'
  end

  def notify_created_reservation
    driver = user
    vehicle_owner = vehicle.user
    reservation = self
    ReservationsMailer.created_for_owner(vehicle_owner,
                                         vehicle, reservation).deliver_later
    ReservationsMailer.created_for_driver(driver, vehicle,
                                          reservation).deliver_later
  end

  def notify_documents_effective
    resource_name = resource.class.to_s
    to = resource.try(:email) || resource.user.email
    LegalDocumentsMailer.documents_effective(resource_name, to).deliver_later
  end
end
