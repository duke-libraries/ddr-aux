module Duracloud
  class AuditLogEntry < ActiveRecord::Base
    include Report

    self.table_name = "duracloud_audit_log_entries"
    self.report_type = "Duracloud::AuditLog"
  end
end
