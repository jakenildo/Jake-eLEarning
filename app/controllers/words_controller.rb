class WordsController < ApplicationController
  before_action :is_admin?, only: [:new, :index, :edit, :update]
  def index 
    @category_name = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id]).paginate(page:  params[:page], per_page: 10 )
  end

  def new
    @category_name = Category.find(params[:category_id])
    @word = Word.new
    3.times { @word.choices.build }
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = "Word & Choices added to Lesson"
      redirect_to categ_words_url(@word.category_id)
    else
      flash[:warning] = "Failed to insert choice into database"
      redirect_to categ_words_url(@word.category_id)
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
    params.require(:word).permit(:category_id,:words, choices_attributes: [:choices, :correct_ans])
  end
  
end
