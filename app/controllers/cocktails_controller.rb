class CocktailsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @cocktail = Cocktail.new
    end 
    
    def index
        @cocktails = Cocktail.all 
    end 

    def create
        @cocktail = @user.cocktails.build(cocktail_params)
        if @cocktail.save 
            redirect_to cocktail_recipes_path(@cocktail, @recipe)
        else 
            render 'new'
        end 
    end 

    def show
    end 

    def edit
    end 

    def update
    end 

private 

    def cocktail_params
            params.require(:cocktail).permit(:name, :instructions,
            recipe_attributes: [:id, :quantity,
            ingredients: [:name]])
    end 

end