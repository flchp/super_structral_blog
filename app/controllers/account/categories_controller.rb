class Account::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to account_categories_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to account_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy

    redirect_to account_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
