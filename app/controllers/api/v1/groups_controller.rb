require "ddr_aux/grouper_gateway"

module Api::V1
  class GroupsController < DirectoryController

    def index
      args = {filter: permitted_params[:filter], subject: permitted_params[:subject]}
      render json: grouper.groups(**args)
    end

    private

    def permitted_params
      params.permit(:filter, :subject)
    end

  end
end
