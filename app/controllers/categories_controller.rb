class CategoriesController < ApplicationController
  def new
  end

  def index
    @categories = Category.paginate(page:
      params[:page], per_page: 10 )
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
  end
end
