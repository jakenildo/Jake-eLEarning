class CategoryController < ApplicationController
  def index
    @category = Category.paginate(page:
      params[:page], per_page: 10 )
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
