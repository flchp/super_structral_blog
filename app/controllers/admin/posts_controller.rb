class Admin::PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all.order("id DESC")
  end

  def set_as_hide
    @post = Post.find(params[:id])
    @post.is_display = false
    @post.save
    redirect_to admin_posts_path
  end

  def set_as_display
    @post = Post.find(params[:id])
    @post.is_display = true
    @post.save
    redirect_to admin_posts_path
  end

  def post_params
    params.require(:post).permit(:is_hidden)
  end
end
