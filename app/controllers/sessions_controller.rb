class SessionsController < ApplicationController

    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    layout 'welcome'

    def new
        redirect_to users_path if logged_in?
    end



end