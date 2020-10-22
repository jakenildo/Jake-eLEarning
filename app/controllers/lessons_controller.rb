class LessonsController < ApplicationController
  def new
    @lessons = Category.paginate(page: params[:page], per_page: 2 ).order('created_at DESC')
    @lesson_info = Lesson.new
  end

  def create
    @lesson_info = Lesson.new(lesson_params)
    if @lesson_info.save
      flash[:success] = "Lesson Start!"
      redirect_to learn_lesson_url(@lesson_info.category_id)
    else
      flash[:warning] = "Failed to Start Lesson"
      redirect_to lessons_url
    end
  end

  def show
    @answers = Answer.new
    @categories = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id])
  end

  private
  def lesson_params
    params.require(:lesson).permit(:user_id, :category_id)
  end

end
