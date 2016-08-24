module Duracloud
  class ManifestEntry < ActiveRecord::Base
    extend Report

    self.table_name = "duracloud_manifest_entries"
    self.report_type = "Duracloud::Manifest"

    def audit_log_entries
      AuditLogEntry.where(space_id: space_id, content_id: content_id)
    end

    def bit_integrity_checks
      BitIntegrityCheck.where(space_id: space_id, content_id: content_id)
    end
  end
end
