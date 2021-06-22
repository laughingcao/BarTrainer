class Ingredient < ApplicationRecord
    belongs_to :user, through :cocktails
    belongs_to :cocktail
end