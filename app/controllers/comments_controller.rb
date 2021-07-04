class CommentsController < ApplicationController
    before_action :current_cocktail

    def new
        if params[:cocktail_id]
            @cocktail = Cocktail.find_by(params[:cocktail_id])
            @comment = Comment.new
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

    private

    def comment_params
        params.require(:comment).permit(:comment_text)
    end
end