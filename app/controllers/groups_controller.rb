class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Group.find_by id: params["id"]
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

  def edit
  end

  def destroy

  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
