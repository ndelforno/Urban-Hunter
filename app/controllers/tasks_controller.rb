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

#
# before_action :select_current_comment, only: [:edit, :update, :destroy]
#
#   def create
#     @comment = Comment.new
#
#     @comment.comment = params[:comment][:comment]
#     @comment.user = current_user
#     @comment.project = Project.find(params[:project_id])
#
#     @comment.save
#
#     redirect_to project_url(params[:project_id])
#   end
#
#   def edit
#   end
#
#   def update
#     @comment.comment = params[:comment][:comment]
#
#     @comment.save
#
#     redirect_to project_url(Project.find(@comment.project_id))
#   end
#
#   def destroy
#     @comment.destroy
#     redirect_to project_url(Project.find(@comment.project_id))
#   end
#
#   private
#
#   def select_current_comment
#     @comment = Comment.find(params[:id])
#     @project = Project.find(params[:project_id])
#   end
