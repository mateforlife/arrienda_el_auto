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
      can :read, LegalDocument
      can :create, LegalDocument
      can :manage, DriverAccount, user_id: user.id
      can :manage, User, id: user.id
      if user&.driver_account&.legal_documents_effective?
        can %i[index read edit create update destroy], Reservation, user_id: user.id
        can :new, Reservation
      end
      can %i[index read], Reservation, vehicle: { user: { id: user.id } }
      can %i[read new create], Payment, reservation: { user: { id: user.id } }
    end
    vehicles_id = user.vehicles.pluck(:id)
    cannot %i[new create], Reservation, vehicle_id: vehicles_id
  end
end
