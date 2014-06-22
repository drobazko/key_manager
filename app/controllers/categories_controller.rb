class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :load_key!

  def index
    @categories = Category.where("user_id is null or user_id = ?", current_user).order(updated_at: :desc)
  end

  def new
    @category = current_user.categories.new
  end

  def edit
    @category = current_user.categories.find(params[:id])
    render 'new'
  end

  def update
    @category = current_user.categories.find(params[:id])
    @category.update(category_params)
    render "errors" unless @category.save
  end

  def create
    @category = current_user.categories.new
    @category.update(category_params)
    
    render "errors" unless @category.save
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
