class CommentsController < ApplicationController

    def new
        if params[:cocktail_id]
            @cocktail = Cocktail.find_by(params[:cocktail_id])
            @comment = Comment.new
        end
    end

    def create
        @cocktail = Cocktail.find_by(params[:cocktail_id])
        @comment = @cocktail.comments.build(comment_params)
        if @comment.save
            redirect_to cocktail_path(@cocktail)
        else
            redirect_to root_path
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:comment_text)
    end

end