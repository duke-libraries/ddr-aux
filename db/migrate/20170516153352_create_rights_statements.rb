class CreateRightsStatements < ActiveRecord::Migration
  def change
    create_table :rights_statements do |t|
      t.string :title,        limit: 255
      t.string :url,          limit: 255
      t.string :short_title,  limit: 255
      t.string :feature,      limit: 255
      t.string :reuse_text,   limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
