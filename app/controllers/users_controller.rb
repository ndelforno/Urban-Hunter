class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @completed_tasks = @user.completed_tasks
  end

  def new
    @user = User.new
    flash[:previous_page] = request.referer
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
      redirect_to request.referer, notice: "Logged in as #{@user.first_name} #{@user.last_name}!"
    else
      redirect_to request.referer, notice: "signup failed !"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update_public
    @user = User.find(params[:id])
    @user.public = params[:user][:public]
    if @user.save
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    if @user.save
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end

end
