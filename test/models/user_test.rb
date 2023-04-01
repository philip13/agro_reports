require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
  end

  test "record user is valid" do
    puts "user #{@user.inspect}"
    assert @user.valid?
  end
end
