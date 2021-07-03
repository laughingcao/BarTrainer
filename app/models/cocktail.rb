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

    scope :martini, -> { where(glassware: 'martini')}
    scope :double_rocks, -> { where(glassware: 'double rocks')}
    scope :coupe, -> { where(glassware: 'coupe')}
    scope :collins, -> { where(glassware: 'collins')}
    scope :nick_nora, -> { where(glassware: 'nick and nora')}
    scope :tiki_mug, -> { where(glassware: 'tiki mug')}
    
end