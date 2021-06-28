class Recipe < ApplicationRecord
    belongs_to :cocktail
    belongs_to :ingredient

    validates :quantity, presence: true
    accepts_nested_attributes_for :ingredient

    def ingredient_attributes=(ingredient_attributes)
        ingredient_attributes.values.each do |i|
            if i != ""
                ingredient = Ingredient.find_or_create_by(name: i.downcase)
                self.ingredient = ingredient
            end 
        end 
    end

end