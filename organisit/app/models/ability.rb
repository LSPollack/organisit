# app/models/ability.rb
class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new
      if user.role? :staff
        can :manage, :all
      else
        can :read, Course
      end
    end
end