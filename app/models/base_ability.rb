# @abstract
class BaseAbility

  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user || User.new
    if @user.admin?
      can :manage, :all
    end
    post_initialize
  end

  def post_initialize; end

end
