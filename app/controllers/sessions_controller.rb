class SessionsController < ApplicationController
  def new
     @user = User.new
    flash[:previous_page] = request.referer
  end

  def create
    @user = User.new
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if flash[:previous_page] && flash[:previous_page] != :login
        redirect_to flash[:previous_page], info: "Logged in !"
      else
        redirect_to request.referer, info: "Logged in as #{@user.first_name} #{@user.last_name} !"
      end

    else
      # flash[:notice] = "Login Failed"
      redirect_to request.referer, info: "Incorrect Username/Password  !"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to request.referer, info: "Logged Out !"
  end
end
