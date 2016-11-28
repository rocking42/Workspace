class OrganisationPostsController < ApplicationController

  before_action :authorized_user

  def show
    @org = Organisation.find_by id: params["id"]
    @all_post = OrganisationPost.where( organisation_id: params["id"]).order('created_at desc').paginate(page: params[:page], per_page: 10)
    @post = @current_user.organisation_posts.new
  end

  def create
    @post = @current_user.organisation_posts.new(orgpost_params)
    @post.organisation_id = params["id"]
    if @post.save
      respond_to do |format|
        format.html { redirect_to organisation_posts_path(params["id"]) }
        format.js #render comments/create.js.erb
      end
    else
      render 'new'
    end
  end

  def destroy

  end

  private

  def orgpost_params
    params.require(:organisation_post).permit(:post, :organisation_id)
  end
end
