class PostsController < ApplicationController

  def index
    @posts = Post.all.order("id DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order("id DESC")
  end

end
