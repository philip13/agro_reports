require "test_helper"

class CropTest < ActiveSupport::TestCase
  test "crop is valid" do
    assert crops(:berries).valid?
  end
end
