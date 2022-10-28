class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :content_name
      t.string :isbn
      t.string :original_title
      t.integer :year
      t.string :language_code
      t.text :images
      t.text :images_urls
      t.string :category
      t.text :plot
      t.string :copyright
      t.text :title
      t.jsonb :wikipedia
      t.decimal :average_rating
      t.integer :rating_count
      t.jsonb :goodreads
      t.text :similar_books
      t.text :description
      t.text :loc_class
      t.jsonb :gutenberg
      t.integer :pages
      t.string :language
      t.string :isbn13
      t.datetime :release_date
      t.text :cover
      t.text :cover_art
      t.text :summary
      t.boolean :content_cleaned
      t.text :classes
      t.boolean :content_available
      t.text :genres
      t.jsonb :contents
      t.integer :author_ids

      t.timestamps
    end
  end
end
