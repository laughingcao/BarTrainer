class Cocktail < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes
    belongs_to :user

    validates :name, presence: true
    validates :instructions, presence: true
    validates :recipes, presence: true
end