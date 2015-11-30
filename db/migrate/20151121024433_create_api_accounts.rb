class CreateApiAccounts < ActiveRecord::Migration
  def change
    create_table :api_accounts do |t|
      t.string :access_id
      t.string :secret_key
    end
  end
end
