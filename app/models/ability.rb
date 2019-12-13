# frozen_string_literal: true

# Ability
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.persisted?
      can :manage, Vehicle, user_id: user.id
      can :read, Vehicle, Vehicle.published
      can :create, LegalDocument
      can :read, LegalDocument, LegalDocument.from_current_user_vehicles(user) do
        true
      end
      can :read, LegalDocument, LegalDocument.from_current_user(user) do
        true
      end
      can :manage, User, id: user.id
    end
  end
end
