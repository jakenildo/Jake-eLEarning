class AnswersController < ApplicationController
  def new
    @answers = Answer.new
    @categories = Category.find(params[:category_id])
    @lesson_id = Lesson.where(user_id: current_user.id, category_id: @categories.id).limit(1)
    @words = Word.where(category_id: params[:category_id]).paginate(page: params[:page], per_page: 1)
  end

  def create
    @answers = Answer.new(ans_params)
    @check = Answer.where(lesson_id: @answers.lesson_id, word_id: @answers.word_id) #checks if the word_id & lesson_id exists, used to avoid dupes
    if @check.exists?
      flash[:warning] = "Answer already exists!"
      redirect_back(fallback_location: root_path)
    else
      if @answers.save
        flash[:success] = "Answer Saved!"
        redirect_back(fallback_location: root_path)
      else
        flash[:warning] = "Failed to Save Answer!"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def show
    @categories = Category.find(params[:category_id])
    @ans = Answer.where(lesson_id: params[:lesson_id])
    @choices = Choice.all
    @words = Word.where(category_id: params[:category_id]).paginate(page: params[:page], per_page: 10)
    @correct_ans = Choice.where(correct_ans: true)
  end

  private
  def ans_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
