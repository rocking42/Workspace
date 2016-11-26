class GroupsController < ApplicationController
  def index
  end
  def show
    @group = Group.find_by id: params["id"]
  end

  def new
  end

  def create

  end

  def edit
  end

  def create

  end

  def destroy

  end
end
