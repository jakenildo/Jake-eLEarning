class AnswersController < ApplicationController
  def new
    @user = User.find(current_user.id) #for the user stats
    @learned_lesson = Lesson.where(user_id: current_user.id, status: 1).count #for the user stats
    @answers = Answer.new
    @categories = Category.find(params[:category_id])
    @lesson_id = Lesson.where(user_id: current_user.id, category_id: @categories.id).limit(1)
    @words = Word.where(category_id: params[:category_id]).paginate(page: params[:page], per_page: 1)

    @total_words = Word.where(category_id: params[:category_id]).count 
    @curr_answers = Answer.where(lesson_id: @lesson_id.ids).count
  end

  def create
    @answers = Answer.new(ans_params)
    @lesson = Lesson.find(@answers.lesson_id)
    @check = Answer.where(lesson_id: @answers.lesson_id, word_id: @answers.word_id) #checks if the word_id & lesson_id exists, used to avoid dupes
    @total_words = Word.where(category_id: @lesson.category_id).count
    @curr_answers = Answer.where(lesson_id: @lesson.id).count
    if @curr_answers == @total_words #checks if the current answers are the same numbers with words
      if @lesson.update_attribute(:status,1) #updates the status field in the lesson
        redirect_to view_result_url(@lesson.category_id) #redirects to view_results page
      else
        flash[:warning] = "Lesson Update Failed!"
      end
    end
    
    if @check.exists?
      flash[:warning] = "Answer already exists!"
    else
      if @answers.save #saves the data into DB
        flash[:success] = "Answer Saved!"
        redirect_back(fallback_location: root_path)
      else
        flash[:warning] = "Failed to Save Answer!"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def show
    #let show auto update the status of the lesson
    @total_words = Word.where(category_id: params[:category_id]).count
    @curr_answers = Answer.where(lesson_id: @lesson.ids).count
    if @curr_answers == @total_words #checks if the current answers are the same numbers with words
      @lesson.update_all(status: 1) #updates the status field in the lesson
    end
    @user = User.find(current_user.id) #for the user stats
    @learned_lesson = Lesson.where(user_id: current_user.id, status: 1).count #for the user stats
    @categories = Category.find(params[:category_id])
    @lesson = Lesson.where(user_id: current_user.id, category_id: params[:category_id])
    @ans = Answer.where(lesson_id: @lesson.ids)
    @choices = Choice.all
    @words = Word.where(category_id: params[:category_id])
    @correct_ans = Choice.where(correct_ans: true)
    @count = 0
  end

  private
  def ans_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
