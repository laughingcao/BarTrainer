class Cocktail < ApplicationRecord
    has_many :ingredients, :through: :recipes
    has_many :recipes
    belongs_to :user
end