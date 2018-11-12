class ApplicationController < ActionController::Base

def current_user
  User.find_by(id: session[:user_id])
end

def first_five_hunts
    @future_hunts_five = Hunt.future_hunts[0..4]
end

def require_login
  unless current_user
      flash[:alert] = "Please log in"
      redirect_to login_url
  end
end

def sign_up
  @user = User.new
end

helper_method :current_user
helper_method :sign_up
helper_method :first_five_hunts

end
