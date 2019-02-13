class DropDuracloudTables < ActiveRecord::Migration
  def up
    drop_table :duracloud_audit_log_entries
    drop_table :duracloud_bit_integrity_checks
    drop_table :duracloud_manifest_entries
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
