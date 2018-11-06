<<<<<<< HEAD:app/controllers/hunt_controller.rb
class HuntController < ApplicationController
=======
class TasksControllers< ApplicationController
  def index
  end
>>>>>>> 171633896a370847799066083c32dfd3b0dfeafa:app/controllers/tasks_controller.rb

    before_action :select_hunt, except: [:index, :new, :create]

    def index
      # @hunts = Hunt.all
      @categories = Category.all
    end

    def new
      @hunt = Hunt.new
    end

    def create
      @hunt = Hunt.new
    end

    def show
    end

    def edit
    end

    def update
    end

    def delete
    end
end

private

def select_hunt
    @hunt = Hunt.find(params[:id])
end

def categories_hunts
  @categories = Category.all
end
