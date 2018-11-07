class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password_digest = params[:user][:password_digest]
      if @user.save
        redirect_to root_url
      else
        render 'new'
      end
  end

  def edit

  end

  def update
  end

  def delete
  end

end
