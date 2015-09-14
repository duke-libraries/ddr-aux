module Api::V1
  class AdminSetsController < ModelController

    def find_params
      params.permit(:code, :title)
    end

  end
end
