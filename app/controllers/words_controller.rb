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
      flash[:success] = "Word & Choices added to Lesson! ^o^/"
      redirect_to categ_words_url(@word.category_id)
    else
      flash[:danger] = "Failed to insert choice into database :("
      redirect_to categ_words_url(@word.category_id)
    end
  end

  def edit
    @word = Word.find(params[:id])
    @category_name = Category.find(@word.category_id)
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Word & Choices Updated! ^o^/"
      redirect_to categ_words_url(@word.category_id)
    else
      flash[:danger] = "Failed to update Word & Choice into database :("
      redirect_to categ_words_url(@word.category_id)
    end
  end


  def destroy
    @temp = Word.find(params[:id])
    if Word.find(params[:id]).destroy
    flash[:danger] = "#{@temp.words} & its Choices are deleted successfully! ^o^/ "
      redirect_to categ_words_url(@temp.category_id)
    else
      flash[:warning] = "Deletion Failed! :("
      redirect_to categ_words_url(@temp.category_id)
    end
  end

  private
  def word_params
    params.require(:word).permit(:category_id,:words, choices_attributes: [:id, :word_id, :choices, :correct_ans])
  end
  
end
