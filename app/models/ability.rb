class Ability
  include CanCan::Ability

  # @param [Object] user
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new
    if user.role_name == "superadmin"
      can :manage, :all
      elsif user.role_name == "user"
        can :read, :all
        can :create, Comment
        can :update, Comment do |comment|
          comment.try(:user) == user || user.role_name == "admin"
          end
      else
        user.role_name == "admin"
        can :create, Post
        can :update, Post
      end
    end

end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities




