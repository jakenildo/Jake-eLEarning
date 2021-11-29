module AnswersHelper
 #this counts all the number of words
 def total_words(category_id)
    return Word.where(category_id: category_id).count
  end

  #this counts all the current answers for the lesson
  def answer_count(lesson_id)
    return Answer.where(lesson_id: lesson_id).count
  end
end
