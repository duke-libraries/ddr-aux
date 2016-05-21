class RenameDuracloudAuditRecords < ActiveRecord::Migration
  def change
    rename_table :duracloud_audit_records, :duracloud_audit_log_entries
  end
end
