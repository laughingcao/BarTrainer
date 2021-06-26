class Cocktail < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes
    belongs_to :user
end