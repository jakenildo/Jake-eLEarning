class WordsController < ApplicationController
  before_action :is_admin?, only: [:new, :index, :edit, :update]
  def index 
    @category_name = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id]).paginate(page:  params[:page], per_page: 10 )
    @correct_ans = Choice.where(word_id: params[:word_id], correct_ans: :true)
  end

  def new
    @category_name = Category.find(params[:category_id])
    @word = Word.new
    @word.choices.build
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = "Word added to Lesson"
      redirect_to lessons_url
    else
      flash[:warning] = "Failed to insert choice into database"
      redirect_to lessons_url
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def word_params
    params.require(:word).permit(:category_id,:words, choice_attributes:[:word_id, :choices,:correct_ans])
  end
  
  def choice_params
    params.require(:choice).permit(:word_id, :choices,:correct_ans)
  end
end
