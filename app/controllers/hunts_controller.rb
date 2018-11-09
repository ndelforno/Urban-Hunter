class HuntsController < ApplicationController

  before_action :select_hunt, except: [:index, :new, :create, :search]
  before_action :set_up_new, only: [:new, :create]
  before_action :categories_hunts, only: [:index, :new, :create, :edit, :update]

  def index
  end

  def new
  end

  def show
    @tasks = @hunt.tasks
    @comment = Comment.new
    @comments = @hunt.comments
  end

  def create
    @hunt.hunt_date = params[:hunt][:hunt_date]
    @hunt.user_id = session[:user_id]
    if @hunt.hunt_exists_on_that_day?
        params[:hunt] = nil
        flash.now[:alert] = "You cannot create more than 1 hunt per day!"
        render :new
    else
      @hunt.name = params[:hunt][:name]
      @hunt.difficulty_level = params[:difficulty_level]
      @hunt.category_id = params[:category_id]
      @hunt.hunt_date = params[:hunt][:hunt_date]
      @hunt.hunt_time = params[:hunt][:hunt_time]
      @hunt.max_participants = params[:hunt][:max_participants]
      @hunt.user_id = session[:user_id]
      @category = Category.find_by(id: params[:category_id])
      if @hunt.save
        flash[:notice] = "Hunt added!"
        redirect_to new_hunt_task_path(@hunt)
      else
        # puts @hunt.errors.full_messages
        params[:hunt] = nil
        render :new
      end
    end
  end

  def edit
    @category = Category.find_by(id: params[:category_id])
  end

  def update
    @hunt.name = params[:hunt][:name]
    @hunt.difficulty_level = params[:difficulty_level]
    @hunt.category_id = params[:category_id]
    @hunt.hunt_date = params[:hunt][:hunt_date]
    @hunt.hunt_time = params[:hunt][:hunt_time]
    @hunt.max_participants = params[:hunt][:max_participants]
    @category = Category.find_by(id: params[:category_id])
    if @hunt.save
      flash[:notice] = "Hunt updated!"
      redirect_to hunt_path(@hunt)
    else
      # puts @hunt.errors.full_messages
      render :edit
    end
  end

  def destroy
    @hunt.destroy
    if @hunt.destroy
      flash[:notice] = "Hunt deleted!"
      redirect_to hunts_path
    end
  end

  def search
    if params[:hunt]
      @hunts = Hunt.where("name like ?", "%#{params[:hunt]}%")
      if @hunts.count >= 0
        flash.now[:notice] = "This search returned #{@hunts.count} hunt(s)."
      elsif params[:hunt] == ""
        flash.now[:notice] = "This search returned all hunts!"
      end
    end
  end

  def join
    if @hunt.available_spots == 0
      flash[:notice] = "This Hunt is fully booked"
    else
      if @hunt.users.include?(current_user)
        flash[:alert] = "You cannot join the hunt twice!"
      else
        @hunt.users << current_user
        flash[:notice] = "You have joined the hunt!"
      end
    end
    redirect_to hunt_path
  end

  def unjoin
    if @hunt.users.include?(current_user)
      @hunt.users.delete(current_user)
      flash[:notice] = "You have left the hunt!"
    end
    redirect_to hunt_path
  end

  private

  def set_up_new
    @hunt = Hunt.new
  end

  def select_hunt
    @hunt = Hunt.find(params[:id])
  end

  def categories_hunts
    @categories = Category.all
  end
end
