require 'test_helper'

class LabelTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "valid with all attributes" do
    z = labels(:one)
    assert z.valid?, "label was not valid"
  end

  test "invalid description gives error message" do
    z = labels(:one)
    z.name = nil
    z.valid?
    assert_match /can't be blank/, z.errors[:name].join,
    "Presence error not found on labels"
  end
end
