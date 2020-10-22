class AnswersController < ApplicationController
  def new
    @answers = Answer.new
    @categories = Category.find(params[:category_id])
    @lesson_id = Lesson.last
    @words = Word.where(category_id: params[:category_id]).paginate(page: params[:page], per_page: 1 )
  end

  def create
    @answers = Answer.new(ans_params)
    if @answers.save
      flash[:success] = "Answer Saved!"
      @categ_id = Lesson.find(@answers.lesson_id)
      redirect_to learn_lesson_url(@categ_id.category_id)
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
