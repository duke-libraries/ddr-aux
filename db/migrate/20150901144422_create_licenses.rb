class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :code
      t.string :title
      t.string :url
      t.text :terms, limit: 65535
    end
  end
end
