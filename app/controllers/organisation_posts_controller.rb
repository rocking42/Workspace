class OrganisationPostsController < ApplicationController
  def show
    @org = Organisation.find_by id: params["id"]
    @post = @current_user.organisation_posts.new
  end

  def create
    @post = @current_user.organisation_posts.new(orgpost_params)
    @post.organisation_id = params["id"]
    if @post.save
      redirect_to organisation_posts_path(params["id"])
    end
  end

  def destroy

  end

  private

  def orgpost_params
    params.require(:organisation_post).permit(:post, :organisation_id)
  end
end
