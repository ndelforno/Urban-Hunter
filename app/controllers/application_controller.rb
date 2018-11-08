class ApplicationController < ActionController::Base

def current_user
  User.find_by(id: session[:user_id])
end

def require_login
  unless current_user
      flash[:alert] = "Please log in"
      redirect_to login_url
  end
end

helper_method :current_user

end
