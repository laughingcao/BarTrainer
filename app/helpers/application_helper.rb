module ApplicationHelper
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def user_session
        session[:user_id] = @user.id
    end
end
