module Api
  class ServicesController < BaseController

    class << self
      def api_routes
        @api_routes ||= Rails.application.routes.routes
          .map { |r| r.path.spec.to_s }
          .select { |r| r.start_with?("/api") }
          .map { |r| r.sub("(.:format)", "") }
      end
    end

    def index
      respond_with self.class.api_routes
    end

  end
end
