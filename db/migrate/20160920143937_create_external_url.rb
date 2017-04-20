class CreateExternalUrl < ActiveRecord::Migration
  def change
    create_table :external_urls do |t|
      t.string :title
      t.string :url
    end
  end
end
