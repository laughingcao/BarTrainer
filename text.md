Models

User
-has_many :cocktails
-has_many :recipes, :through, :cocktails

-email
-password digest

Cocktail

-name
-instructions
-user id

-belongs_to :user
-has_many ingredients, :through, :recipes
-has_many recipes

Ingredient
-name
-has many recipes
-has many cocktails through recipes

Recipes
-cocktail id
-ingredient id
-quantity

-belongs_to cocktail
-belongs_to :ingredients