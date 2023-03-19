class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story

  def create
    @comment = @story.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to story_path(@story), notice: 'Comment has been created'
    else
      redirect_to story_path(@story), alert: 'Comment has not been created'
    end
  end

  def destroy
    @comment = @story.comments.find(params[:id])
    @comment.destroy
    redirect_to story_path(@story)
  end

  def update
    @comment = @story.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to story_url(@story), notice: 'Comment has been updated' }
      else
        format.html { redirect_to story_url(@story), alert: 'Comment updation failed.' }
      end
    end
  end

  private

  def set_story
    @story = Story.find(params[:story_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
