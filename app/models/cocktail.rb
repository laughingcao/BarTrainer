class Cocktail < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes
    belongs_to :user

    validates_associated :recipes

    validates :name, presence: true
    validates :instructions, presence: true
    validates :recipes, presence: true

    accepts_nested_attributes_for :recipes, limit: 8,  :reject_if => proc { |attrs| attrs[:quantity].blank? || attrs[:ingredient_attributes][:name].blank?}
end