class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.string :gender
      t.text :summary
      t.datetime :born
      t.datetime :died
      t.jsonb :wikipedia
      
      t.timestamps
    end
  end
end
