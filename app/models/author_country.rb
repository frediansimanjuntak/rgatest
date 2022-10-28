class AuthorCountry < ApplicationRecord
    belongs_to :author
    belongs_to :country
end
