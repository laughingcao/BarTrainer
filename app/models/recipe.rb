class Recipe < ApplicationRecord
    belongs_to :cocktail
    belongs_to :ingredient

    validates :quantity, presence: true
    accepts_nested_attributes_for :ingredient
end