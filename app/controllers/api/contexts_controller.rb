module Api
  class ContextsController < BaseController

    rescue_from NameError, with: :not_found

    def show
      model = params[:id].camelize.constantize # raises NameError
      response.content_type = "application/ld+json"
      respond_with model.new.jsonld_context
    end

  end
end
