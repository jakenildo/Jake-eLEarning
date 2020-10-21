class LessonsController < ApplicationController
  def index
    @lessons = Category.paginate(page: params[:page], per_page: 2 ).order('created_at ASC')
  end

  def show
    @categories = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id])
  end
end
