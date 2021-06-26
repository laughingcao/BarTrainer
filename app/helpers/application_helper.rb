module ApplicationHelper
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def user_session
        session[:user_id] = @user.id
    end

    def logged_in?
        session[:guest_id] != nil
    end

    def require_login
        render 'errors/not_logged_in', :layout => "welcome" if session[:user_id].nil?
    end

    def authenticate(user)
        user && user.authenticate(params[:password])
    end

end
