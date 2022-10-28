class BookCountry < ApplicationRecord
  belongs_to :book
  belongs_to :country
end
