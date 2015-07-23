module Api
  class BaseController < ApplicationController

    respond_to :json
    protect_from_forgery with: :null_session

    self.ability_class = Api::Ability

    rescue_from CanCan::AccessDenied, with: :forbidden

    private

    def set_jsonld_content_type
      response.content_type = Mime::JSONLD
    end

    def jsonld_for_collection(collection)
      collection.map { |resource| jsonld_for(resource) }
    end

    def jsonld_for(resource)
      resource.as_jsonld.merge("@id"=>url_for(resource))
    end

    def forbidden
      error 403
    end

    def not_found
      error 404
    end

    def error(status)
      render nothing: true, status: status
    end

  end
end
