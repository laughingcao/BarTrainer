class Ingredient < ApplicationRecord
   has_many :recipes
   has_many :cocktails, through: :recipes

   validates :name, presence: true
   before_save { self.name = name.downcase }
end