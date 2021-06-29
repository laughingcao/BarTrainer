class CocktailsController < ApplicationController
    before_action :current_user
    before_action :redirect_if_not_logged_in

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
        @cocktail = current_user.cocktails.build(cocktail_params)
        if @cocktail.save 
            redirect_to user_cocktail_path.user_id(user_id, cocktail_id)
        else 
            8.times { @cocktail.recipes.build.build_ingredient}
            render 'new'
        end
    end 

    def show
        @cocktail = Cocktail.find_by(id: params[:id])
    end 

    def edit
        @cocktail = Cocktail.find_by(id: params[:id])
        count = @cocktail.recipes.size
        if count < 8
            available_ingredients = 8 - count
            available_ingredients.times { @cocktail.recipes.build.build_ingredient}
        end
    end 

    def update
        @cocktail = Cocktail.find_by(id: params[:id])
        @cocktail.update(cocktail_params)
        redirect_to user_cocktail_path(@cocktail.user.id, @cocktail) 
    end 

    def destroy
        @cocktail = Cocktail.find_by(id: params[:id])
        @cocktail.destroy
        redirect_to user_cocktails_path(current_user)
    end 

private 

    def cocktail_params
            params.require(:cocktail).permit(
                :name, :instructions, 
                recipes_attributes: [:id, :quantity, ingredient_attributes: [:name]])
    end 

end