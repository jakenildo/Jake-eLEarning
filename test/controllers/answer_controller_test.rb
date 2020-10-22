require 'test_helper'

class AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get answer_new_url
    assert_response :success
  end

end
