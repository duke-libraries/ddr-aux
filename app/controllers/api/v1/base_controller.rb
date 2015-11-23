module Api::V1
  class BaseController < ApplicationController

    respond_to :json
    protect_from_forgery with: :null_session

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
      head(status, content_type: "application/json")
    end

  end
end
