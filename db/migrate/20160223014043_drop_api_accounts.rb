class DropApiAccounts < ActiveRecord::Migration
  def up
    drop_table :api_accounts
  end

  def down
    create_table "api_accounts", force: true do |t|
      t.string "access_id"
      t.string "secret_key"
    end
  end
end
