# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:seller?)
      can :create, Souvenir
      cannot [:pay], Souvenir
    elsif user.present?
      can :pay, Souvenir
      can :read, Souvenir
    else
      can :read, Souvenir
    end
  end
end
