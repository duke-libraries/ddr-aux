module Api
  class BaseController < ApplicationController

    respond_to :json

    self.ability_class = Api::Ability

    before_action :set_request_format

    protect_from_forgery with: :null_session

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from CanCan::AccessDenied, with: :forbidden

    protected

    def set_request_format
      request.format = :json
    end

    def forbidden
      respond_with({message: "Access to the requested resource is denied."}, status: 403)
    end

    def not_found
      respond_with({message: "The requested resource was not found."}, status: 404)
    end

  end
end
