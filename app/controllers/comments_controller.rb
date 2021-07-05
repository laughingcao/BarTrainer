class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :redirect_if_not_comment_author, only: [:edit, :update, :destroy]

    def index
        if params[:cocktail_id] && @cocktail = Cocktail.find_by_id(params[:cocktail_id])
            @comments = @cocktail.comments
        else
            @error = "That cocktail doesn't exist" if params[:cocktail_id]
            @comments = Comment.all
        end
    end

    def new
        if params[:cocktail_id] && @cocktail = Cocktail.find_by_id(params[:cocktail_id])
            @comment = @cocktail.comments.build
        else
            @error = "That cocktail doesn't exit yet. You should create it." if params[:cocktail_id]
            @comment = Comment.new
        end
    end
    
    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save 
            redirect_to comments_path(@comment)
        else 
            render :new
        end
    end 

    def show
        @user = current_user
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path{@comment}
        else
            render :edit
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy
        redirect_to comments_path
    end 

    private

    def comment_params
        params.require(:comment).permit(:comment_text, :cocktail_id)
    end

    def redirect_if_not_comment_author
        @comment = Comment.find_by(id: params[:id])
        redirect_to comments_path if @comment.user != current_user
     end

end