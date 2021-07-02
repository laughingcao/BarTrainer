class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create
      @user = User.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        user_session
        redirect_to cocktails_path(@user)
      else
        flash[:message] = "wrong login info, please try again"
        render 'new'
      end
    end
    
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end

    def omniauth
      binding.pry
    end

end