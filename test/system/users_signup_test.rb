require "application_system_test_case"

class UsersSignupTest < ApplicationSystemTestCase
  test "Signup" do
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email)
    visit new_user_registration_path

    assert_selector "h2", text: I18n.t("devise.registrations.new.title")
    fill_in "user[name]", with: user.name
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    fill_in "user[account_attributes][name]", with: "Account #{user.name}"
    click_button I18n.t("devise.registrations.new.sign_up")

    assert_text I18n.t("devise.registrations.signed_up")
    assert_selector "h2", text: I18n.t("accounts.show.title")
    assert_text "Account #{user.name}"
    assert_text user.email
  end
end
