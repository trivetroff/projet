require 'test_helper'

class TownTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "town validation does geocoding" do
    belfort = Town.new
    belfort.name ='belfort'
    assert belfort.valid?
    assert_equal(47.6379599, belfort.latitude)
  end
end
