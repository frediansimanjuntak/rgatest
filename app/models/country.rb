class Country < ApplicationRecord
    has_many :author_countries
    has_many :authors, through: :author_countries
end
