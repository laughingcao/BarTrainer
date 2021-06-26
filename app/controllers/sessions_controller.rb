class SessionsController < ApplicationController

    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    layout 'welcome'

    def new
        redirect_to users_path if logged_in?
    end

    def create
        # response.headers['Set-Cookie'] = 'Secure;SameSite=None'
        @user = User.find_by(email: params[:email])
        if @user.nil?
          @error = "Email not found"
          render :new
        else
          if authenticate(@user)
            user_session
          else
            @error = "Invalid password"
            render :new
          end
        end
      end
    
      def destroy
        session[:guest_id] = nil
        redirect_to root_path
      end



end