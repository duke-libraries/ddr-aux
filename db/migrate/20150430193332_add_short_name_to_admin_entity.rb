class AddShortNameToAdminEntity < ActiveRecord::Migration
  def change
    change_table :admin_entities do |t|
      t.string :short_name
    end
  end
end
