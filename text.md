Models

User
-has_many :cocktails
-has_many :recipes, :through, :cocktails

Cocktail
-belongs_to :user
-has_many ingredients, :through, :recipes
-has_many recipes

Ingredient
-belongs_to :recipe, :through, :cocktails

Recipe
-belongs_to cocktail
-belongs_to :user, :through :cocktails
-has_many :ingredients