class CreateDuracloudAuditRecords < ActiveRecord::Migration
  def change
    create_table :duracloud_audit_records do |t|
      t.string   :account,          index: true
      t.string   :store_id,         index: true
      t.string   :space_id,         index: true
      t.string   :content_id,       index: true
      t.string   :content_md5
      t.integer  :content_size,     index: true
      t.string   :content_mimetype, index: true
      t.text     :content_properties
      t.string   :space_acls
      t.string   :source_space_id
      t.string   :source_content_id
      t.datetime :timestamp
      t.string   :action,           index: true
      t.string   :username,         index: true
    end
  end
end
