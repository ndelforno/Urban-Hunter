class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @user_hunts = @user.hunts.order(hunt_date: :desc)
    # @user_participations = @user.participations.order(id: :desc)
    # <% @articles.joins(:comments).order('comments.created_at desc').group('articles.title').each do |article| %>
    # <% @user.participations.each do |participation| %>
    
  end

  def new
    @user = User.new
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
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
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
