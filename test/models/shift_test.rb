require "test_helper"

class ShiftTest < ActiveSupport::TestCase
  test "should save valid shift" do
    shift = Shift.new(shift_name: "Day Shift", cycle_time: 1.5, performance: 2.0, start_time: Time.now)
    assert shift.save
  end

  test "should not save shift without shift_name" do
    shift = Shift.new(cycle_time: 1.5, performance: 2.0, start_time: Time.now)
    assert_not shift.save, "Saved the shift without a shift_name"
  end
end
