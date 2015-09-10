class DropCodeFromLicenses < ActiveRecord::Migration
  def change
    remove_column :licenses, :code, :string
  end
end
