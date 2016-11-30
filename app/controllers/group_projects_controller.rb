class GroupProjectsController < ApplicationController
  def show
    @group = Group.find_by id: params["group_id"]
    @group_project = GroupProject.find_by id: params["id"]
    @new_user_task = UserTask.new
    @all_user_tasks = @group_project.user_tasks.all
  end

  def new
    @group = Group.find_by id: params["group_id"]
    @group_project = @group.group_projects.new
  end

  def create
    @group = Group.find_by id: params["group_id"]
    organisation = @group.organisation
    @group_project = @group.group_projects.new(group_project_params)
    @group_project.organisation_id = organisation.id
    @group_project.users << @current_user
    if @group_project.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @group_project = GroupProject.find_by( id: params["id"]).delete
    redirect_to @group_project.group
  end

  def join
    @group_project = GroupProject.find_by id: params["id"]
    @group_project.users << @current_user
    redirect_to group_group_project_path(params["group_id"], @group_project)
  end

  private

  def group_project_params
    params.require(:group_project).permit(:task, :start_date, :end_date)
  end
end
