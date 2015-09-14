class CreateAdminSet < ActiveRecord::Migration
  def change
    create_table :admin_sets do |t|
      t.string :code
      t.string :title
      t.timestamps
    end
  end
end
