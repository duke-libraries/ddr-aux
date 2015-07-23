class DropAdminEntities < ActiveRecord::Migration
  def change
    drop_table :admin_entities do |t|
      t.string   "slug"
      t.string   "name"
      t.string   "phone"
      t.string   "email"
      t.string   "url"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "short_name"
    end
  end
end
