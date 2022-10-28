class CreateAuthorCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :author_countries do |t|
      t.integer :author_id
      t.integer :country_id 

      t.timestamps
    end
  end
end
