require 'test_helper'

class HuntTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_available_spot
    hunt = build(:hunt)
    12.times do
      user = build(:user)
      hunt.users << user
    end

    actual = hunt.available_spots
    expected  = 8

    assert(expected, actual)
  end

  def test_hunt_exists_on_that_day?
    category = create(:category)
    user = create(:user)

    hunt = create(:hunt)
    hunt.category_id = category.id
    hunt.users << user

    hunt2 = create(:hunt)
    hunt2.category_id = category.id
    hunt2.users << user

    p hunt2


    actual = hunt2.hunt_exists_on_that_day?
    expected = true

    assert(expected, actual)

  end

end
