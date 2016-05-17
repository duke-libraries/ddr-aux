class AddApiKeyToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :api_key
    end
  end
end
