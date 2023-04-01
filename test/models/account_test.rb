require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "invalid with out name" do
    account = Account.new

    assert_not account.valid?
  end

  test "invalid with repeated name" do
    account = accounts(:account1)
    new_account = Account.new(name: account.name)

    assert_not new_account.valid?
  end
end
