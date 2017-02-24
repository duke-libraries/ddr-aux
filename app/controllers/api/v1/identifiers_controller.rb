module Api::V1
  class IdentifiersController < BaseController

    api_authenticate except: :show

    rescue_from NotImplementedError, with: :not_found

    def index
      raise NotImplementedError
    end

    def show
      identifier = Ezid::Identifier.find(params[:id])
      data = identifier.remote_metadata.to_h # https://github.com/duke-libraries/ezid-client/issues/71
      data.merge!(id: identifier.id)         # https://github.com/duke-libraries/ezid-client/issues/57
      render json: data
    rescue Ezid::IdentifierNotFoundError, e
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
