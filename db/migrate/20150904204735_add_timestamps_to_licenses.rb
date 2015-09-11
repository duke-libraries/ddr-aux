class AddTimestampsToLicenses < ActiveRecord::Migration
  def change
    add_timestamps :licenses
  end
end
