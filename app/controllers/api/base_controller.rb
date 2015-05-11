module Api
  class BaseController < ApplicationController

    respond_to :json
    protect_from_forgery with: :null_session

    self.ability_class = Api::Ability

    rescue_from CanCan::AccessDenied, with: :forbidden

    private

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
