class DropOrganizations < ActiveRecord::Migration
  def change
    drop_table :organizations do |t|
      t.string   "name"
      t.string   "short_name"
      t.string   "phone"
      t.string   "email"
      t.string   "url"
      t.string   "ask"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
