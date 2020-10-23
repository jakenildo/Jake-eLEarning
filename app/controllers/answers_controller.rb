class AnswersController < ApplicationController
  def new
    @answers = Answer.new
    @categories = Category.find(params[:category_id])
    @lesson_id = Lesson.where(user_id: current_user.id, category_id: @categories.id).limit(1)
    @words = Word.where(category_id: params[:category_id]).paginate(page: params[:page], per_page: 1)
  end

  def create
    @answers = Answer.new(ans_params)
    @less_id = Lesson.where(category_id: params[:category_id], user_id: current_user.id)
    if @answers.save
      flash[:success] = "Answer Saved!"
      redirect_back(fallback_location: root_path)
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
