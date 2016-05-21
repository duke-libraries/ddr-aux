module Api::V1
  class Duracloud::ManifestEntriesController < BaseController

    # api_authenticate

    def index
      space_id, content_id = index_params.require(:space_id), index_params.require(:content_id)
      results = ::Duracloud::ManifestEntry
                .where(space_id: space_id)
                .content(content_id)
      results.where(store_id: index_params[:store_id]) if index_params[:store_id].present?
      # json_results = results.map do |result|
      #   result.as_json.tap do |j|
      #     j["bit_integrity_checks"] = result.bit_integrity_checks.map(&:as_json)
      #     j["audit_log_entries"] = result.audit_log_entries.map(&:as_json)
      #   end
      # end
      render json: results
    end

  end
end
