class GroupPostsController < ApplicationController
  def show
    @group = Group.find_by id: params["id"]
    @all_post = GroupPost.where( group_id: params["id"]).order('created_at desc').paginate( page: params[:page], per_page: 10)
    @post = @group.group_posts.new
  end

  def create
    @group = Group.find_by id: params[:subaction]
    @post = @current_user.group_posts.new(group_post_params)
    @post.group_id = params[:subaction]
    if @post.save
      respond_to do |format|
        format.html { redirect_to group_post_path(@group) }
        format.js
      end
    else
      render 'show'
    end
  end

  private

  def group_post_params
    params.require(:group_post).permit(:post)
  end

end
