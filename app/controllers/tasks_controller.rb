class TasksController< ApplicationController

  def index
  end

  def new
    @task = Task.new
    @hunt = Hunt.find(params[:hunt_id])
  end

  def create
    @task = Task.new
    @hunt = Hunt.find(params[:hunt_id])
    @task.details = params[:task][:details]
    @task.neighbourhood = params[:task][:neighbourhood]
    @task.address = params[:task][:address]
    @task.hunt = @hunt


        if @task.save

          redirect_to new_category_hunt_task_path(@task)
        # else
        #   redirect_to category_hunt
        end


  end

  def show


        #@task = Task.find(params[:id])
        @tasks = Task.all
  end

  def edit
  end

  def update
  end

  def delete
  end

end
