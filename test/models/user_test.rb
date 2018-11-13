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


  def test_user_can_be_created
    user = build(:user)

    assert user.valid?
  end

  def test_full_name
    user = create(:user, first_name: "nick", last_name:"delfo")
    actual = user.full_name
    expected = "nick delfo"
    assert_equal(expected,actual)
  end

  def test_user_must_have_first_name
    user = build(:user, last_name: "Smith", email: 'nick@hotmail.com', password: 'password', password_confirmation: 'password')
    user.first_name = nil

    refute user.valid?
  end

  def test_user_must_have_last_name
    user = build(:user, first_name: "Smith", email: "nick@hotmail.com", password: 'password', password_confirmation: 'password')
    user.last_name = nil

    assert user.invalid?
  end

  def test_user_must_have_email
    user = build(:user, first_name: "Smith", password: 'password', password_confirmation: 'password')
    user.email = nil

    refute user.valid?
  end
  #
  def test_user_must_have_password
    user = build(:user)
    user.password = nil

    refute user.valid?
  end

  def test_user_must_have_password_confirmation
    user = build(:user)
    user.password_confirmation = nil

    refute user.valid?
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

  def test_user_must_be_unique
    user = create(:user)
    user2 = build(:user)

    refute user2.valid?
  end

end
