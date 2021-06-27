class CocktailsController < ApplicationController
    
    def index
        if params[:user_id] #index cocktails for a specific user
            @cocktails = Cocktail.user_cocktails_index(current_user)
        elsif params[:query] #index cocktails based on search query
            @cocktails = Cocktail.query_cocktails_index(params[:query]) 
            if !@cocktails
                flash[:alert] = "No cocktails match your search query" 
                @cocktails = Cocktail.all
            else
                flash[:alert].clear unless flash[:alert] == nil
                @cocktails
            end
        else 
            @cocktails = Cocktail.all 
        end 
    end 

    def new
        @cocktail = Cocktail.new
        5.times { @cocktail.cocktail_ingredients.build.build_ingredient}
    end 

    def create
        @cocktail = @user.cocktails.build(cocktail_params)
        if @cocktail.save 
            redirect_to user_cocktail_path(@user, @cocktail)
        else 
            5.times { @cocktail.cocktail_ingredients.build.build_ingredient}
            render 'new'
        end 
    end 

    def show
    end 

    def edit
        count = @cocktail.recipes.size
        if count < 5
            available_ingredients = 5 - count
            available_ingredients.times {@cocktail.recipes.build.build_ingredient}
        end
    end 

    def update
        @cocktail.update(cocktail_params)
        redirect_to user_cocktail_path(@cocktail.user.id, @cocktail) 
    end 

private 

    def cocktail_params
            params.require(:cocktail).permit(:name, :instructions, :image,
            recipe_attributes: [:id, :quantity,
            ingredient_attributes: [:name]])
    end 

end