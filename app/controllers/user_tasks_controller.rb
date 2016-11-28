class UserTasksController < ApplicationController
  def show
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

  def edit
  end

  def update
  end

  private

  def user_task_params
    params.require(:user_task).permit(:task, :end_date)
  end
end
