# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :Souvenir
    if user.present?
      can :pay, Souvenir
    elsif user.seller?
      can  :manage, Souvenir
      cannot [:pay], Souvenir
    else
    end
  end
end
