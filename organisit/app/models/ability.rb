# app/models/ability.rb
class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new
      if user.role? :staff
        can :manage, :all
      elsif user.role? :student
        # can :read, Course
      else
        # static pages only
      end
    end
end