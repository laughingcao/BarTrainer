class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            user_session
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to cocktails_path
        else
            render :edit
        end
    end

    def destroy
        current_user.destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private
    
    def user_params
        params.require(:user).permit(:email.downcase, :password, :password_confirmation)
    end
end