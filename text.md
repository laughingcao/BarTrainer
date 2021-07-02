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

NESTED routes

users/:id/cocktails - INDEX all the cocktails of specific user

users/:id/edit
    -form to add new cocktail - name

users/cocktails - INDEX all the cocktails of all users
    -get only - 

cocktails/:id/recipes - INDEX of all recipes of one cocktail

cocktails/:id/recipes/:id/edit
    -get
    -create
    -edit
    -delete

cocktails/:id/recipes/:id - one cocktail one recipe

    -show