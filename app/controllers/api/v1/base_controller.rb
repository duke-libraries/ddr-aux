module Api::V1
  class BaseController < ApplicationController

    respond_to :json
    protect_from_forgery with: :null_session

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
