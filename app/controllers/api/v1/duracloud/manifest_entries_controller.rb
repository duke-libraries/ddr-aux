module Api::V1
  module Duracloud
    class ManifestEntriesController < BaseController

      # api_authenticate

      def fcrepo3
        results = ::Duracloud::ManifestEntry
                  .fcrepo3(params.require(:object_uri))
                  .where(space_id: params.require(:space_id))
        results.where(store_id: params[:store_id]) if params[:store_id].present?
        render json: results
      end

    end
  end
end
