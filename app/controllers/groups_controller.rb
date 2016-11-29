class GroupsController < ApplicationController

  before_action :authorized_user

  def index
  end

  def show
    @group = Group.find_by id: params["id"]
    @group_project = GroupProject.where group_id: params["id"]
    @new_group_project = GroupProject.new
    @all_post = @group.group_posts.order('created_at desc')
  end

  def new
    @group = Group.new
    respond_to do |format|
      format.html { redirect_to new_group_path(@group) }
      format.js
    end
  end

  def create
    @group = @current_user.organisations.first
    @new_group = @group.groups.new(group_params)
    if @new_group.save
      @new_group.users << @current_user
      redirect_to organisation_url(@group.id)
    else
      render 'new'
    end
  end

  def join
    @group = Group.find_by id: params["id"]
    @group.users << @current_user
    flash[:sucess] = "Group joined successfully"
    redirect_to @group
  end

  def leave
    group = Group.find_by id: params["id"]
    @current_user.groups.delete(group)
    redirect_to group.organisation
  end

  def user
    @group = Group.find_by id: params["id"]
  end

  def edit
  end

  def destroy
    @group = Group.find_by( id: params["id"]).delete
    redirect_to @current_user.organisations.first
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
