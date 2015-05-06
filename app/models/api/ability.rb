module Api
  class Ability < ::BaseAbility

    def post_initialize
      can [:show, :index], :all
    end

  end
end
