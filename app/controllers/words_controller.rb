class WordsController < ApplicationController
  before_action :is_admin?, only: [:new, :index, :edit, :update]
  def index 
    @category_name = Category.find(params[:category_id]).title
    @words = Word.where(category_id: params[:category_id]).paginate(page:  params[:page], per_page: 10 )
    @correct_ans = Choice.where(word_id: params[:word_id], correct_ans: :true)
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
