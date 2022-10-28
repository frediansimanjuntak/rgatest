class Author < ApplicationRecord
    validates :name, presence: true
    
    has_many :author_books
    has_many :books, through: :author_books

    has_many :author_countries
    has_many :countries, through: :author_countries
end
