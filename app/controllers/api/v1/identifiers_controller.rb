module Api::V1
  class IdentifiersController < BaseController

    api_authenticate except: :show

    rescue_from NotImplementedError, with: :not_found

    def index
      raise NotImplementedError
    end

    def show
      identifier = Ezid::Identifier.find(params[:id])
      # `id` must be merged into hash
      # https://github.com/duke-libraries/ezid-client/issues/57
      render json: {id: identifier.id}.merge(identifier.to_h)
    rescue Ezid::Error, e # https://github.com/duke-libraries/ezid-client/issues/58
      not_found
    end

    def create
      raise NotImplementedError
    end

    def update
      raise NotImplementedError
    end

    def destroy
      raise NotImplementedError
    end

  end
end
