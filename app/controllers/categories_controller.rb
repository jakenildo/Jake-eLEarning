class CategoriesController < ApplicationController
  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(categories_params)
    if @categories.save
      flash[:success] = "Added new Lesson!"
      redirect_to categories_path
    else
      flash[:warning] = "Failed to add Lesson"
      render 'new'
    end
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
  
  private
  def categories_params
    params.require(:category).permit(:title, :description)
  end

end
