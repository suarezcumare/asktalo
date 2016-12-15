require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  def assert_presence(model, field)
    model .valid?
    assert_match /can't be blank/, model.errors[field].join,
    "Presence error for #{field} not found on #{model.class}"
  end

  def setup
    @z = questions(:one)
  end

  test "valid with all attributes" do
    assert @z.valid?, "Question was not valid"
  end

  test "invalid description gives error message" do
    @z.description = nil
    @z.valid?
    assert_match /can't be blank/, @z.errors[:description].join,
    "Presence error not found on questions"
  end

  test "should contain only answers that belong to question" do
    assert @z.answers.all? {|t| t.question == z }
  end



end
