class TaskCommentsController < ApplicationController

  def create
    @usertask = UserTask.find_by id: params[:action]
    @post = @current_user.task_comments.new(group_post_params)
    @post.user_task_id = params[:subaction]
    binding.pry
    if @post.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      render 'show'
    end
  end

  private

  def group_post_params
    params.require(:task_comment).permit(:comment, :image)
  end

end
