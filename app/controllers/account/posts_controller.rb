class Account::PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order("id DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to account_posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to account_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    redirect_to account_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :is_set_as_public, :is_set_as_model)
  end
end
