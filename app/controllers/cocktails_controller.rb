class CocktailsController < ApplicationController
    before_action :current_user
    before_action :redirect_if_not_logged_in

    def new
        @cocktail = Cocktail.new
        8.times { @cocktail.recipes.build.build_ingredient}
    end 
    
    def index
        @cocktails = Cocktail.all 
    end 

    def create
        @cocktail = current_user.cocktails.build(cocktail_params)
        if @cocktail.save 
            redirect_to user_cocktail_path(@user, @cocktail)
        else 
            8.times { @cocktail.recipes.build.build_ingredient}
            render 'new'
        end
    end 

    def show
        @cocktail = current_user.recipes.all
    end 

    def edit
    end 

    def update
    end 

private 

    def cocktail_params
            params.require(:cocktail).permit(
                :name, :instructions, 
                recipes_attributes: [:id, :quantity, ingredient_attributes: [:name]])
    end 

end