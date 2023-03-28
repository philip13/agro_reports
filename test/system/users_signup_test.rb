require "application_system_test_case"

class UsersSignupTest < ApplicationSystemTestCase
  test "Signup" do
    user = User.new(name: Faker::Name.name , email: Faker::Internet.email)
    visit new_user_registration_path
    
    assert_selector "h2", text: "Sign up"
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    fill_in "Account name", with: "Account #{user.name}"
    click_button "Sign up"

    assert_text "Welcome! You have signed up successfully."

    # extend permited parameters on devise check issues on github
    # relationship one account have a user owner_id 
    # user accept nested attributes of account
    # redirect to account details 
  end
end