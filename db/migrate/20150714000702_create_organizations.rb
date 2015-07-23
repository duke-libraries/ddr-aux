class CreateOrganizations < ActiveRecord::Migration

  def change
    create_table :organizations do |t|
      t.string :name
      t.string :short_name
      t.string :phone
      t.string :email
      t.string :url
      t.string :ask
      t.timestamps
    end
  end

end
