class CreateDuracloudManifestEntries < ActiveRecord::Migration
  def change
    create_table :duracloud_manifest_entries do |t|
      t.string :space_id,   index: true
      t.string :content_id, index: true
      t.string :md5
    end
  end
end
