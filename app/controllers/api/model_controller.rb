module Api
  # @abstract
  class ModelController < BaseController

    class_attribute :find_by_attribute
    self.find_by_attribute = :id

    # Subclasses must set, or override `context_for(obj)`
    class_attribute :context

    # before filters
    before_action :find_resource, only: :show
    load_resource only: :index
    authorize_resource
    before_action :set_jsonld_content_type

    # after filters
    check_authorization

    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    # GET /api/{plural_resource_name}
    def index
      render json: resources.map { |r| jsonld_for(r) }
    end

    # GET /api/{plural_resource_name}/{id}
    def show
      render json: jsonld_for(resource)
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

    def find_resource
      result = resource_class.find_by!(self.class.find_by_attribute => params[:id])
      instance_variable_set("@#{resource_name}", result)
    end

    def resource
      @resource ||= instance_variable_get("@#{resource_name}")
    end

    def resources
      @resources ||= instance_variable_get("@#{resource_name.pluralize}")
    end

    def set_jsonld_content_type
      response.content_type = Mime::JSONLD
    end

    def iri_for(obj)
      url_for iri_for_options(obj)
    end

    def iri_for_options(obj)
      { id: obj, controller: controller_name, action: :show }.tap do |opts|
        if base_iri
          opts[:protocol] = base_iri.scheme
          opts[:host] = base_iri.host
          opts[:port] = base_iri.port if base_iri.port != base_iri.default_port
        end
      end
    end

    def base_iri
      @base_uri ||= if Rails.configuration.ddr_aux.base_iri
                      URI.parse(Rails.configuration.ddr_aux.base_iri)
                    end
    end

    def context_for(obj)
      context.new(obj)
    end

    def jsonld_for(obj)
      context_for(obj).as_jsonld.merge("@id" => iri_for(obj))
    end

  end
end
