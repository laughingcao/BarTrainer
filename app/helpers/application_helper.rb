module ApplicationHelper
    
    def current_user
       @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def user_session
        session[:user_id] = @user.id
    end

    def logged_in?
       !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end

    def current_cocktail
        @cocktail = Cocktail.find_by(id: params[:id])
    end

    def authenticate(user)
        user && user.authenticate(params[:password])
    end

    def cocktail_owner
        if !current_user.cocktails.include?(current_cocktail)
            flash[:alert] = "You can't edit this recipe!"
            redirect_to user_path(current_user)
        end 
    end

end
