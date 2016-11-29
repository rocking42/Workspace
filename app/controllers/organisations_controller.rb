class OrganisationsController < ApplicationController

  before_action :authorized_user

  def index
    @all_org = Organisation.all
  end

  def show
    @org = Organisation.find_by id: params["id"]
    @all_post = @org.organisation_posts.order('created_at desc')
    @group = Group.new
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

  def calendar
    @org = Organisation.find_by id: params["id"]
    @groups = @org.groups.all
    @group_projects = @org.group_projects.all
  end

  def time
    @org = Organisation.find_by id: params["exorg"]
    @exam = params["exam"]
    respond_to do |format|
      format.html { redirect_to org_cal_path(@exorg) }
      format.js { @org }
    end
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
