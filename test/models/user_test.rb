require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should save valid user" do
    shift = shifts(:one) # Fixturesを使用している場合
    user = User.new(username: "arisa", shift: shift)
    assert user.save
  end

  test "should not save user without username" do
    shift = shifts(:one)
    user = User.new(shift: shift)
    assert_not user.save, "Saved the user without a username"
  end
end
