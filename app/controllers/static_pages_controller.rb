class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user.id)
      @lesson = Lesson.where(user_id: current_user.id)
      @activity = Activity.where(user_id: current_user.id)
      @relationship = Relationship.where(follow_id: current_user.id)
    end
  end

  def setting
  end
end
