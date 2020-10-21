require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lessons_index_url
    assert_response :success
  end

  test "should get lesson_words" do
    get lessons_lesson_words_url
    assert_response :success
  end

end
