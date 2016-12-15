require 'test_helper'

class QuestionsTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "the truth" do
    assert true
  end

  test "Anyone can view question information" do
    question = questions(:one)
    get question_url(question)
    assert_response :success
    assert_select "h4", "Questions"
  end

end
