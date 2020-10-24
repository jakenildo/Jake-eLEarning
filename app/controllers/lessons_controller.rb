class LessonsController < ApplicationController
  def new
    @categories = Category.paginate(page: params[:page], per_page: 2 ).order('created_at DESC')
    @lesson_info = Lesson.new
    @learned = Lesson.where(user_id: current_user.id, status: 1)
    @not_learned = Lesson.where(user_id: current_user.id, status: 0)
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

  private
  def lesson_params
    params.require(:lesson).permit(:user_id, :category_id, :status)
  end
end
