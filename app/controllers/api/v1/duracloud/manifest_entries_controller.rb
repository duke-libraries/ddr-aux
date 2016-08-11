module Api::V1
  module Duracloud
    class ManifestEntriesController < BaseController

      # api_authenticate

      def index
        space_id, content_id = index_params.require(:space_id), index_params.require(:content_id)
        results = ::Duracloud::ManifestEntry
                  .where(space_id: space_id)
                  .content(content_id)
        results.where(store_id: index_params[:store_id]) if index_params[:store_id].present?
        render json: results
      end

      private

      def index_params
        params.permit(:space_id, :content_id, :store_id)
      end

    end
  end
end
