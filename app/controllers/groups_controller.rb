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
    redirect_to root_url
    @group = @current_user.organisations.first
    @group.groups.new(group_params)
    if @group.save
      @group
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
