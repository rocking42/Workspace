class UserTasksController < ApplicationController
  def show
    @group_project = GroupProject.find_by id: params["group_project_id"]
    @user_task = UserTask.find_by id: params["id"]
    @all_post = TaskComment.where( user_task_id: params["id"]).order('created_at desc').paginate(page: params[:page], per_page: 10)
    @post = @current_user.task_comments.new
    @user = @user_task.user
  end

  def new
    @group_project = GroupProject.find_by id: params["group_project_id"]
    @user_task = @group_project.user_tasks.new
  end

  def create
    @group_project = GroupProject.find_by id: params["group_project_id"].to_i
    @group = @group_project.group
    @user_task = @group_project.user_tasks.new(user_task_params)
    @current_user.user_tasks << @user_task
    if @user_task.save
      redirect_to group_group_project_path(@group, @group_project)
    else
      render 'new'
    end
  end

  def completed
    @user_task = UserTask.find_by id: params[:id]
    @user_task.completed = true
    @user_task.save
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end

  def edit
  end

  def update
  end

  private

  def user_task_params
    params.require(:user_task).permit(:task, :end_date)
  end
end
