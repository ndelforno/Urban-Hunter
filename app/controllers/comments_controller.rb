class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new

    @comment.description = params[:comment][:description]
    @comment.user = current_user
    @comment.hunt = Hunt.find(params[:hunt_id])

    @comment.save
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
