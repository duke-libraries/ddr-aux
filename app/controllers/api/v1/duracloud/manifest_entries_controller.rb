module Api::V1
  module Duracloud
    class ManifestEntriesController < BaseController

      # Accepts POST with content-type 'application/json'
      #
      # Example body
      #
      # { "space_id": "foo",
      #   "content_ids": ["bar", "baz"]
      # }
      #
      def select
        space_id = params.require(:space_id)
        content_ids = params[:content_ids]
        results = ::Duracloud::ManifestEntry.where(space_id: space_id, content_id: content_ids)
        render json: results
      end

    end
  end
end
