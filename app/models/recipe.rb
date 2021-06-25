class Recipe < ApplicationRecord
    belongs_to :cocktail
    belongs_to :user, :through :cocktails
    has_many :ingredients
end