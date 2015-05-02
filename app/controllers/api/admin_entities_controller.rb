module Api
  class AdminEntitiesController < BaseController

    load_resource find_by: :slug
    authorize_resource

    def index
      respond_with @admin_entities
    end

    def show
      respond_with @admin_entity
    end

  end
end
