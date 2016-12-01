class TaskCommentsController < ApplicationController

  def create
    @usertask = UserTask.find_by id: (params[:subaction])
    @post = @current_user.task_comments.new(group_post_params)
    @post.user_task_id = params[:subaction]
    if params["task_comment"]["image"]
      a = Cloudinary::Uploader.upload(params["task_comment"]["image"])
      @post.image = a["public_id"]
    end

    if @post.save
      TaskComment.where( user_id: @usertask.user.id).mark_as_read! :all, :for => @current_user
      respond_to do |format|
        # format.json { render :json => @post }
        format.js
        format.html { redirect_to user_task_path(@usertask.group_project, @usertask) }
      end
    else
      render 'create'
    end
  end

  private

  def group_post_params
    params.require(:task_comment).permit(:comment, :image)
  end

end
