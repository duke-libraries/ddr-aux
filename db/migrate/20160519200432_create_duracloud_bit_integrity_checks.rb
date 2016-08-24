class CreateDuracloudBitIntegrityChecks < ActiveRecord::Migration
  def change
    create_table :duracloud_bit_integrity_checks do |t|
      t.datetime :date_checked, index: true
      t.string   :account,      index: true
      t.string   :store_id,     index: true
      t.string   :store_type
      t.string   :space_id,     index: true
      t.string   :content_id,   index: true
      t.string   :result,       index: true
      t.string   :content_checksum
      t.string   :provider_checksum
      t.string   :manifest_checksum
      t.string   :details
    end
  end
end
