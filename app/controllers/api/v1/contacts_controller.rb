module Api::V1
  class ContactsController < ModelController

    def find_params
      params.permit(:slug, :name)
    end

  end
end
