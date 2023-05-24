require "test_helper"

class SectorTest < ActiveSupport::TestCase
  test "sector is valid" do
    assert sectors(:sector1).valid?
  end
end
