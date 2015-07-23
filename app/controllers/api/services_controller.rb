module Api
  class ServicesController < BaseController

    def contacts
      render json: { organizations: jsonld_for_collection(Organization.all) }
    end

  end
end
