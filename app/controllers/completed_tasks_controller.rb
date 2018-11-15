class CompletedTasksController < ApplicationController
  def index
  end

  def new
    @completed_task = CompletedTask.new
    @task = Task.find(params[:id])
  end

  def create
    @completed_task = CompletedTask.new
    @task = Task.find(params[:task_id])

    @completed_task.user = current_user
    @completed_task.task = @task
    @completed_task.proof = params[:completed_task][:proof]
    @completed_task.image.attach(params[:completed_task][:image])

    @completed_task.completed = true
    if @completed_task.save
      redirect_to("/hunts/#{@task.hunt_id}/tasks/#{@task.id}")
    else
      redirect_to("/hunts/#{@task.hunt_id}/tasks/#{@task.id}")
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
end
