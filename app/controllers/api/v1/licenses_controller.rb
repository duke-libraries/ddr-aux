module Api::V1
  class LicensesController < ModelController

    def find_resource
      resource_class.find_by!(code: params[:code])
    end

    def select_resources
      resource_class.select(:id, :code, :title, :url)
    end

  end
end
