module Api::V1
  class LicensesController < ModelController

    def select_resources
      resource_class.where(resources_params).select(:id, :code, :title, :url)
    end

    private

    def resources_params
      params.permit(:id, :code, :url, :title)
    end

  end
end
