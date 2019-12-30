# frozen_string_literal: true

# Ability
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.basic?
      can :manage, Vehicle, user_id: user.id
      can :read, Vehicle, status: %i[published rented]
      # legal_documents_from_user_resources = LegalDocument.resources_from_user(user).pluck(:id)
      can :read, LegalDocument
      can :create, LegalDocument
      can :manage, DriverAccount, user_id: user.id
      can :manage, User, id: user.id
      cannot :index, Reservation
      if user&.driver_account&.legal_documents_effective?
        can :create, Reservation
        can :create, Payment
      end
      can :read, Payment, reservation: { user: { id: user.id } }
      can %i[read edit destroy], Reservation, user_id: user.id
    end
    vehicles_id = user.vehicles.pluck(:id)
    cannot :create, Reservation, vehicle_id: vehicles_id
  end
end
