class HuntsController < ApplicationController

    before_action :select_hunt, except: [:index, :new, :create]
    before_action :set_up_new, only: [:new, :create]
    before_action :categories_hunts, only: [:index, :new, :create]

    def index
      # @hunts = Hunt.all
      # @categories = Category.all
    end

    def new
      # @categories = Category.all
    end

    def create
      # @categories = Category.all
      @hunt.name = params[:hunt][:name]
      @hunt.difficulty_level = params[:difficulty_level]
      @hunt.category_id = params[:category_id]
      @hunt.hunt_date = params[:hunt][:hunt_date]
      @hunt.hunt_time = params[:hunt][:hunt_time]
      # @hunt.user_id = sessions[:user_id]
      @category = Category.find_by(id: params[:category_id])
      if @hunt.save
        # if the picture gets saved, generate a get request to "/pictures" (the index)
        flash[:notice] = "Hunt added!"
        redirect_to category_hunt_path(@category, @hunt)
      else
        # otherwise render new.html.erb
        puts @hunt.errors.full_messages
        flash[:alert] = "Hunt not added!"
        render :new
      end

    end

    def show
    end

    def edit
    end

    def update
    end

    def delete
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
