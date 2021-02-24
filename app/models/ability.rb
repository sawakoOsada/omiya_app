# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:seller?)
      can :access, :rails_admin
      can  :manage, :all
      cannot [:pay], Souvenir
    elsif user.present?
      can :pay, Souvenir
      can :read, Souvenir
    else
      can :read, Souvenir
    end
  end
end
