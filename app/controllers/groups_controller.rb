class GroupsController < ApplicationController

  before_action :authorized_user

  def index
  end

  def show
    @group = Group.find_by id: params["id"]
    @all_post = @group.group_posts.order('created_at desc')
  end

  def new
    @group = Group.new
  end

  def create
    @group = @current_user.organisations.first
    @group.groups.new(group_params)
    if @group.save
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
