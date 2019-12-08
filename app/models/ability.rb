# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.persisted?
      can :manage, Vehicle, user_id: user.id
      can :read, Vehicle, visible: true
      can :create, LegalDocument
      can :read, LegalDocument do |document|
        document.from_current_user_vehicle?(user)
      end
    end
  end
end
