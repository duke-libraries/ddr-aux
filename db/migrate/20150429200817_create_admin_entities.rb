class CreateAdminEntities < ActiveRecord::Migration
  def change
    create_table :admin_entities do |t|
      t.string :slug
      t.string :name
      t.string :phone
      t.string :email
      t.string :url
      t.string :ask
      t.timestamps
    end
  end
end
