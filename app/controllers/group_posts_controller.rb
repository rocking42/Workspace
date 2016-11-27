class GroupPostsController < ApplicationController
  def show
    @group = Group.find_by id: params["id"]
    @all_posts = @group.group_posts.all
    @post = @group.group_posts.new
  end

  def create
    @group = Group.find_by id: params[:subaction]
    @post = @current_user.group_posts.new(group_post_params)
    @post.group_id = params[:subaction]
    if @post.save
      redirect_to group_post_path(@group)
    else
      render 'show'
    end
  end

  private

  def group_post_params
    params.require(:group_post).permit(:post)
  end

end
