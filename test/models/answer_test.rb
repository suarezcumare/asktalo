require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "valid with all attributes" do
    z = anwers(:one)
    assert z.valid?, "Anwers was not valid"
  end

  test "invalid description gives error message" do
    z = anwers(:one)
    z.description = nil
    z.valid?
    assert_match /can't be blank/, z.errors[:description].join,
    "Presence error not found on anwers"
  end



end
