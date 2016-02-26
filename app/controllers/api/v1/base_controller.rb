require "ddr_aux/api"

module Api::V1
  class BaseController < ApplicationController

    respond_to :json
    protect_from_forgery with: :null_session

    def self.api_authenticate(*args)
      before_action :api_authenticate_with_http_basic, *args
    end

    def self.skip_api_authenticate(*args)
      skip_before_action :api_authenticate_with_http_basic, *args
    end

    private

    def api_authenticate_with_http_basic
      @current_user = authenticate_with_http_basic { |id, key| ::User.api_authenticate(id, key) }
      if !@current_user
        request_http_basic_authentication
      end
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
