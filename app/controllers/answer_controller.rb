class AnswerController < ApplicationController
  def new
    @answers = Answer.new
    @categories = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id])
  end

  def create
    @answers = Answer.new(ans_params)
    if @answers.save
      flash[:success] = "Answer Saved!"
      redirect_to learn_lesson_url(@answers.category_id)
    else
      flash[:warning] = "Failed to Save Answer!"
      redirect_to lessons_url
    end
  end

  private
  def ans_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
