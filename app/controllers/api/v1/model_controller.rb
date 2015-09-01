module Api::V1
  # @abstract
  class ModelController < BaseController

    attr_reader :resource, :resources
    before_action :index_resources, only: :index
    before_action :show_resource, only: :show

    # GET /api/{plural_resource_name}
    def index
      render json: resources
    end

    # GET /api/{plural_resource_name}/{id}
    def show
      render json: resource
    end

    protected

    # The singular name for the resource class based on the controller
    # e.g., AdminEntitiesController => 'admin_entity'
    # @return [String]
    def resource_name
      @resource_name ||= self.controller_name.singularize
    end

    # The resource class based on the controller
    # @return [Class]
    def resource_class
      @resource_class ||= resource_name.classify.constantize
    end

    private

    def show_resource
      @resource = find_resource
    end

    def find_resource
      resource_class.find(params[:id])
    end

    def index_resources
      @resources = select_resources
    end

    def select_resources
      resource_class.all
    end

  end
end
