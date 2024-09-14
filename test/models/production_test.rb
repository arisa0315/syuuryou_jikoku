require "test_helper"

class ProductionTest < ActiveSupport::TestCase
  test "should save valid production" do
    shift = shifts(:one) # Fixturesを使用している場合
    production = Production.new(shift: shift, production_quantity: 100)
    production.calculate_end_time
    assert production.save
  end

  test "should not save production without shift" do
    production = Production.new(production_quantity: 100)
    assert_not production.save, "Saved the production without a shift"
  end
end
