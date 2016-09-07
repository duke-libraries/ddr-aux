class DropDuracloudIdColumns < ActiveRecord::Migration
  def up
    remove_column :duracloud_manifest_entries, :id
    remove_column :duracloud_audit_log_entries, :id
    remove_column :duracloud_bit_integrity_checks, :id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
