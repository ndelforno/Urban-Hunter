require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "factory_must_be_valid" do
    user = build(:user)

    assert user.valid?


  end

  test "user_is_invalid_without_the_first_name" do
    user = build(:user)
    user.first_name = nil

    refute user.valid?

  end

  def test_full_name
    user = create(:user, first_name: "nick", last_name:"delfo")
    actual = user.full_name
    expected = "nick delfo"
    assert_equal(expected,actual)
  end

end
