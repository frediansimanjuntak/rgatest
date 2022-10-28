class Book < ApplicationRecord
  validates :title, presence: true
  has_many :author_books
  has_many :authors, through: :author_books

  has_many :book_countries
  has_many :countries, through: :book_countries

  serialize :classes, Array
  serialize :similar_books, Array
  serialize :images, Array
  serialize :genres, Array

  scope :having_authors, -> (required_authors) { includes(:authors).where(authors: {id: required_authors}) }

end
