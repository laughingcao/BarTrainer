class Ingredient < ApplicationRecord
    belongs_to :recipe, :through :cocktails
end