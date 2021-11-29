class LessonsController < ApplicationController
  def index
    @user = current_user
    @page = params[:filter]
    if params[:filter] == "Learned"
      @categories = current_user.categories.where.not(lessons: {result: nil})
    elsif params[:filter] == "Not Learned"
      @categories = Category.left_outer_joins(:lessons)
                          .where.not(id: current_user.lessons
                          .where.not(lessons: {result: nil}))
    else
      @page = "all"
      @categories = Category.all
    end
    @categories = @categories.paginate(page: params[:page]).limit(2)
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)
    if @category.words.any?
      @lesson.save
      @action = Activity.create(actionable: Lesson.last, user_id: current_user.id)
      redirect_to new_lesson_answer_url(@lesson)
    else
      flash[:danger] = "There are no words in this category yet"
      redirect_to lessons_url
    end
  end

  def show
    @user = current_user
    @answers = Answer.where(lesson_id: params[:id])
    @correct_answers = 0

      Answer.where(lesson_id: params[:id]).each do |word|
        word.word.choices.each do |count|
          if word.choice.correct_ans == count.correct_ans
            @correct_answers = @correct_answers+=1
            break
          end
        end
      end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:user_id, :category_id, :status)
  end
end
