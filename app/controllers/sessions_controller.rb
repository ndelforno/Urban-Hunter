class SessionsController < ApplicationController
  def new
    flash[:previous_page] = request.referer
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if flash[:previous_page] && flash[:previous_page] != :login
        redirect_to flash[:previous_page], notice: "Logged in!"
      else
        redirect_to root_path, notice: "Logged in!"
      end
    else
      flash[:notice] = "Login Failed"
      redirect_to request.referer
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to request.referer, notice: "Logged Out!"
  end
end
