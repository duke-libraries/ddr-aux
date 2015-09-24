class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :slug
      t.string :name
      t.string :short_name
      t.string :url
      t.string :phone
      t.string :email
      t.string :ask
    end
  end
end
