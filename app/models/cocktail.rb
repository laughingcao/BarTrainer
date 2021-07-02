class Cocktail < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes
    belongs_to :user

    validates_associated :recipes

    validates :name, presence: true
    validates :instructions, presence: true
    validates :recipes, presence: true
    validates :garnish, presence: true
    validates :glassware, presence: true
    validates :ice_type, presence: true

    accepts_nested_attributes_for :recipes, limit: 8,  :reject_if => proc { |attrs| attrs[:quantity].blank? || attrs[:ingredient_attributes][:name].blank?}

    scope :up, -> { where(ice_type: 'up')}
    scope :rocks, -> { where(ice_type: 'rocks')}
    scope :big_rock, -> { where(ice_type: 'big rock')}
    scope :crushed_ice, -> { where(ice_type: 'crushed ice' || 'pebble ice')}
    
end