require "ddr_aux/api"

module Api::V1
  class BaseController < ApplicationController

    respond_to :json
    protect_from_forgery with: :null_session

    def self.api_authenticate(*args)
      if DdrAux::Api.api_auth_enabled
        if args.empty?
          self.before_action :api_authenticate
        else
          self.before_action :api_authenticate, *args
        end
      end
    end

    private

    def api_authenticate
      account = ::ApiAccount.find_by_access_id(ApiAuth.access_id(request))
      if account && ApiAuth.authentic?(request, account.secret_key)
        return true
      end
      unauthorized
    end

    def forbidden
      error :forbidden
    end

    def not_found
      error :not_found
    end

    def unauthorized
      error :unauthorized
    end

    def bad_request
      error :bad_request
    end

    def error(status)
      code = Rack::Utils.status_code(status)
      message = status.to_s.titleize
      content = { error: { message: message, code: code } }
      render json: content, status: status
    end

  end
end
