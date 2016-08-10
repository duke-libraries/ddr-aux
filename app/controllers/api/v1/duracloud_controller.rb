module Api::V1
  class DuracloudController < BaseController

    # api_authenticate

    def index
      results = DuracloudManifestEntry
                .where(space_id: params[:space_id])
                .content(params[:content_id])
      results.where(store_id: params[:store_id]) if params[:store_id].present?
      json_results = results.map do |result|
        result.as_json.tap do |j|
          j["bit_integrity_checks"] = result.bit_integrity_checks.map(&:as_json)
          j["audit_records"] = result.audit_records.map(&:as_json)
        end
      end
      render json: json_results
    end

  end
end
