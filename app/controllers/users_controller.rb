class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            user_session
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
        current_user.destroy
        session[:guest_id] = nil
        redirect_to root_path
    end

    private
    
    def user_params
        params.require(:guest).permit(:email.downcase, :password, :password_confirmation)
    end
end