class RecipesController < ApplicationController

def new
    @recipe = Recipe.new
end

def index
    if params[:cocktail_id] && @cocktail = Cocktail.find_by_id(params[:cocktail_id])
        @recipes = @cocktail.recipes
    else
        @error = "That Cocktail doesn't exit yet. Maybe you should create it." if params[:cocktail_id]
        @recipes = Recipe.all
    end
end


end