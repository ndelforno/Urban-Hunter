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

          redirect_to new_hunt_task_path
        else
         render 'tasks/new'
        end


  end

  def show
    @task = Task.find(params[:id])
    @completed_task = CompletedTask.new
    @hunt = Hunt.find(params[:hunt_id])
  end

  def edit
    @task = Task.find(params[:id])
    @hunt = Hunt.find(params[:hunt_id])

  end

  def update
    @task = Task.find(params[:id])
    @hunt = Hunt.find(params[:hunt_id])
    @task.details = params[:task][:details]
    @task.neighbourhood = params[:task][:neighbourhood]
    @task.address = params[:task][:address]

    if @task.save
      flash[:notice] = "Modified Task :  #{@task.details.upcase} !"
      redirect_to("/hunts/#{@hunt.id}")
    else
      # flash.now[:notice] = "Task not Updated !"
      render :new
    end

  end

  def destroy
    @task = Task.find(params[:id])
    @hunt = Hunt.find(params[:hunt_id])
    @task.destroy
    if @task.destroy

      flash[:notice] = "Task  #{@task.details.upcase} Deleted !"
      redirect_to ("/hunts/#{@hunt.id}")
    end
  end

end
