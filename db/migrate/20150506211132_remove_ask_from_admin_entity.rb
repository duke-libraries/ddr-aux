class RemoveAskFromAdminEntity < ActiveRecord::Migration
  def change
    remove_column :admin_entities, :ask, :string
  end
end
