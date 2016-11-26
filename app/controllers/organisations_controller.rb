class OrganisationsController < ApplicationController
  def index
    @all_org = Organisation.all
  end

  def show
    @org = Organisation.find_by id: params["id"]
  end

  def user
    @org = Organisation.find_by id: params["id"]
  end

  def new
    @org = Organisation.new
  end

  def create
    @org = Organisation.new(org_params)
    if @org.save
      flash[:create] = "Organisation created successfully"
      redirect_to @org
    else
      render 'new'
    end
  end

  def edit
    @org = Organisation.find_by id: params["id"]
  end

  def update
    @org = Organisation.find_by id: params["id"]
    if @org.update(org_params)
      flash[:update] = "Organisation updated successfully"
      redirect_to @org
    else
      render 'edit'
    end
  end

  def join
    @org = Organisation.find_by id: params["id"]
      @org.users << @current_user
      redirect_to @current_user
  end

  def destroy
    @org = Organisation.find_by( id: params["id"]).delete
    redirect_to root_url
  end

  private

  def org_params
    params.require(:organisation).permit(:name, :description, :location)
  end
end
