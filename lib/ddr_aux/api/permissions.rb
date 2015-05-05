module DdrAux::Api
  class Permissions < DdrAux::Permissions

    def apply
      if request.local?
        localhost_abilities
      end
    end

    private

    def localhost_abilities
      can [:show, :index], :all
    end

  end
end
