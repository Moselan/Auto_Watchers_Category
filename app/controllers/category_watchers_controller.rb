class CategoryWatchersController < ApplicationController
  before_action :require_admin

  def index
    @categories = Category.all
  end

  def update
    category = Category.find(params[:category_id])
    category.category_watchers.destroy_all
    params[:user_ids].each do |user_id|
      category.category_watchers.create(user_id: user_id)
    end
    redirect_to category_watchers_path, notice: "Seguidores actualizados."
  end
end
