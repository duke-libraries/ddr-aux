module Api::V1
  class GroupsController < DirectoryController

    def index
      subject = permitted_params[:subject]
      filter = permitted_params[:filter]
      render json: grouper.groups(subject: subject, filter: filter)
    end

    def show
      render json: grouper.group(params.require(:name))
    end

    def members
      group = grouper.group(params.require(:name))
      members = group ? group.members : []
      render json: members
    end

    private

    def permitted_params
      params.permit(:filter, :subject)
    end

  end
end
