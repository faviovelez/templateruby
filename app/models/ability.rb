class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      elsif user.basic?
        can :read, :all
        can :edit, [Subject, Reply]
        can :update, [Subject, Reply]
      elsif user.editor?
        can :read, :all
        can :edit, [Subject, Reply]
        can :update, [Subject, Reply]
        can :destroy, [Subject, Reply]
      else
        can :read, :all
      end
  end
end
