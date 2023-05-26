require "application_system_test_case"

class UserLoginTest < ApplicationSystemTestCase
  test "Login" do
    user = users(:user1)
    visit new_user_session_path

    assert_selector "h2", text: I18n.t("devise.sessions.new.title")
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "123456"
    click_button I18n.t("devise.sessions.new.log_in")

    assert_text I18n.t("devise.sessions.signed_in")
    assert_selector "h2", text: I18n.t("accounts.show.title")
    assert_text user.account.name
    assert_text user.email
  end
end
