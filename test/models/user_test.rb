require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "valid with all attributes" do
    z = users(:one)
    assert z.valid?, "User was not valid"
  end

  test "invalid first_name gives error message" do
    z = users(:one)
    z.first_name = nil
    z.valid?
    assert_match /can't be blank/, z.errors[:first_name].join,
    "Presence error not found on user"
  end

  test "should contain only question that belong to User" do
    z = users(:one)
    assert z.questions.all? {|t| t.user == z }
  end


end
