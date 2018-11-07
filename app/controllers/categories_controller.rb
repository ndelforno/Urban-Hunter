
class CategoriesController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @category = Category.find(params[:id])
  end


  def update
  end

  def delete
  end
end
