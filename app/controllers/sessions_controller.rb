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
      @user = User.create_from_omniauth(auth)
      if @user.valid?
        user_session
        redirect_to cocktails_path
      else
        flash[:message] = @user.errors.full_messages
        redirect_to login_path
      end
    end

    private

    def auth
      request.env['omniauth.auth']
    end

end