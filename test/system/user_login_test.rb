require "application_system_test_case"

class UserLoginTest < ApplicationSystemTestCase
  test "Login" do
    user = users(:user1)
    visit new_user_session_path

    assert_selector "h2", text: "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "123456"
    click_button "Log in"

    assert_text "Signed in successfully."
    assert_selector "h2", text: "Account Details"
    assert_text "Account1"
    assert_text user.email
  end
end
