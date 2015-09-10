module Api::V1
  class LicensesController < ModelController

    def select_resources
      resource_class.select(:id, :title, :url)
    end

    def find_params
      params.permit(:url, :title)
    end

  end
end
