module LessonsHelper
  def check_if_learned(category_id)
    return Lesson.where( category_id: category_id, user_id:current_user).exists?
  end

  def current_page?(state)
    return "active" if @page.eql?(state)
  end

  def check_score(id)
    score = 0 
    Answer.where(lesson_id: id).each do |word|
      word.word.choices.each do |count|
        if word.choice.correct_ans == count.correct_ans
          score = score+1
          break
        else
          break
        end
      end
    end
    return score
  end
end