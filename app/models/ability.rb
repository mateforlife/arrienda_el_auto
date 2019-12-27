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
      can :create, Reservation
      can :read, Reservation, user_id: user.id
      can :create, Payment
      can :read, Payment, reservation: { user: { id: user.id } }
    end
  end
end
