require "application_system_test_case"

class UserForgotPasswordTest < ApplicationSystemTestCase
  test "Send password instruction" do
    user = users(:user1)
    visit new_user_password_path

    assert_selector "h2", text: I18n.t("devise.passwords.new.title")
    fill_in "user[email]", with: user.email
    click_button I18n.t("devise.passwords.new.send_me_instructions")

    assert_text I18n.t("devise.passwords.send_instructions")
  end
end
