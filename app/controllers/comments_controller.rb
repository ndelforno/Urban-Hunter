class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
    @hunt = Hunt.find(params[:id])

  end

  def create
    @comment = Comment.new
    @hunt = Hunt.find(params[:hunt_id])
    @comment.description = params[:comment][:description]
    @comment.user = current_user
    @comment.hunt = Hunt.find(params[:hunt_id])

    if @comment.save
      redirect_to hunt_url(@comment.hunt)
    else
      render :show
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
end
