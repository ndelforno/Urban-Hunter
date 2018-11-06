class HuntController < ApplicationController

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
