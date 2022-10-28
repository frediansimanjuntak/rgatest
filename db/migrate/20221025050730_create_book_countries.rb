class CreateBookCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :book_countries do |t|
      t.integer :book_id
      t.integer :country_id 

      t.timestamps
    end
  end
end
