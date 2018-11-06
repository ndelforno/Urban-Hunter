class TasksController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

end
