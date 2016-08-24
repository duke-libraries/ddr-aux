module RailsAdmin
  #
  # Ability class for RailsAdmin
  #
  # Always performed
  # can :access, :rails_admin # needed to access RailsAdmin
  #
  # Performed checks for `root` level actions:
  # can :dashboard            # dashboard access
  #
  # Performed checks for `collection` scoped actions:
  # can :index, Model         # included in :read
  # can :new, Model           # included in :create
  # can :export, Model
  # can :history, Model       # for HistoryIndex
  # can :destroy, Model       # for BulkDelete
  #
  # Performed checks for `member` scoped actions:
  # can :show, Model, object            # included in :read
  # can :edit, Model, object            # included in :update
  # can :destroy, Model, object         # for Delete
  # can :history, Model, object         # for HistoryShow
  # can :show_in_app, Model, object
  #
  class Ability
    include CanCan::Ability

    attr_reader :user

    def initialize(user)
      @user = user || User.new
      apply_normal_abilities
      apply_admin_abilities if user.admin?
    end

    def apply_admin_abilities
      can :manage, :all
    end

    def apply_normal_abilities
      can :access, :rails_admin
      can :dashboard
      can [ :read, :export ], [ AdminSet, Contact, License ]
    end

  end
end
