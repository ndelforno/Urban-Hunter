class HuntsController < ApplicationController

    before_action :select_hunt, except: [:index, :new, :create]
    before_action :set_up_new, only: [:new, :create]
    before_action :categories_hunts, only: [:index, :new, :create, :edit, :update]

    def index
      if params[:hunt]
        @hunts = Hunt.where("name like ?", "%#{params[:hunt]}%")
      else
        @hunts = Hunt.all
      end
    end

    def new
    end

    def show
    end

    def join
      if(current_user)
        if @hunt.users.include?(current_user)
          flash[:alert] = "You cannot join the hunt twice!"
        else
          @hunt.users << current_user
          flash[:notice] = "You have joined the hunt!"
        end
      else
        flash[:alert] = "You need to log in to join a hunt!"
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

    def create
      @hunt.name = params[:hunt][:name]
      @hunt.difficulty_level = params[:difficulty_level]
      @hunt.category_id = params[:category_id]
      @hunt.hunt_date = params[:hunt][:hunt_date]
      @hunt.hunt_time = params[:hunt][:hunt_time]
      @hunt.user_id = session[:user_id]
      @category = Category.find_by(id: params[:category_id])
      if @hunt.save
        flash[:notice] = "Hunt added!"
        redirect_to hunt_path(@hunt)
      else
        # puts @hunt.errors.full_messages
        flash[:alert] = "Hunt not added!"
        render :new
      end
    end

    def edit
      @category = Category.find_by(id: params[:category_id])
      # puts @category.inspect
    end

    def update
      # puts @hunt.errors.full_messages
      # puts @hunt.inspect
      @hunt.name = params[:hunt][:name]
      @hunt.difficulty_level = params[:difficulty_level]
      @hunt.category_id = params[:category_id]
      @hunt.hunt_date = params[:hunt][:hunt_date]
      @hunt.hunt_time = params[:hunt][:hunt_time]
      @category = Category.find_by(id: params[:category_id])
      if @hunt.save
        flash[:notice] = "Hunt updated!"
        redirect_to hunt_path(@hunt)
      else
        # puts @hunt.errors.full_messages
        flash[:alert] = "Hunt not updated!"
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
