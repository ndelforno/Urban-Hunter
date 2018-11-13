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

  def test_user_must_have_first_name
    user = build(:user, last_name: "Smith", email:'nick@hotmail.com', password: 'password', password_confirmation: 'password')
    user.first_name = nil

    refute user.valid?
  end

  def test_user_must_have_last_name
    user = build(:user)
    user.last_name = nil

    assert user.invalid?
  end

  def test_user_must_have_email

  end

  def test_user_password_must_match_password_confirmation
    user = build(:user)
    user.password = "123"

    refute user.valid?
  end

  def test_user_password_confirmation_must_match_password
    user = build(:user)
    user.password_confirmation = "123"

    refute user.valid?
  end


end
