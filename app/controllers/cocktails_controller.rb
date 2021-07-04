class CocktailsController < ApplicationController
    before_action :current_user
    before_action :redirect_if_not_logged_in
    before_action :current_cocktail

    def new
        @cocktail = Cocktail.new
        8.times { @cocktail.recipes.build.build_ingredient}
    end 
    
    def index
        if params[:user_id] && @user = User.find_by(params[:user_id])
            @cocktails = @user.cocktails
        else
            @error = "That Cocktail Doesn't exist" if params[:user_id]
            @cocktails = Cocktail.all
        end
    end 

    def create
        @user = current_user
        @cocktail = current_user.cocktails.build(cocktail_params)
        if @cocktail.save 
            redirect_to user_cocktails_path(current_user, @cocktail)
        else 
           8.times { @cocktail.recipes.build.build_ingredient}
            render 'new'
        end
    end 

    def show
    end 

    def edit
        count = @cocktail.recipes.size
        if count < 8
            available_ingredients = 8 - count
            available_ingredients.times { @cocktail.recipes.build.build_ingredient}
        end
    end 

    def update
        @cocktail.update(cocktail_params)
        redirect_to user_cocktail_path(@cocktail.user.id, @cocktail) 
    end 

    def destroy
        @cocktail.destroy
        redirect_to user_cocktails_path(current_user)
    end 

private 

    def cocktail_params
            params.require(:cocktail).permit(
                :name, :instructions, :glassware, :garnish, :ice_type,
                recipes_attributes: [:id, :quantity, ingredient_attributes: [:name]])
    end 

end