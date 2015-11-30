module Api::V1
  # @abstract
  class ModelController < BaseController

    # GET /api/{plural_resource_name}
    def index
      resources = resource_class.where(permitted_params)
      render json: resources
    end

    # GET /api/{plural_resource_name}/{id}
    def show
      resource = resource_class.find(params.require(:id))
      render json: resource
    end

    # GET /api/{plural_resource_name}/find?{params}
    def find
      warn "[DEPRECATION] `find` is deprecated. Use `index` and select the first record." \
           " (called from #{caller.first})"
      resource = resource_class.find_by!(permitted_params)
      render json: resource
    end

    protected

    def resource_name
      params.require(:model).singularize
    end

    def resource_class
      @resource_class ||= resource_name.classify.constantize
    end

    private

    def permitted_params
      params.permit(resource_class.attribute_names)
    end

  end
end
