require "application_system_test_case"

class UserHaveCollaboratorsTest < ApplicationSystemTestCase
  setup do
    @user = users(:user1)
    sign_in @user
  end

  test "visiting the index" do
    users(:collaborator1)
    visit collaborators_url
    assert_selector "h1", text: I18n.t("collaborators.index.title")

    assert_selector "tbody", count: @user.collaborators.count
  end

  test "should invite collborators" do
    collaborator_email = Faker::Internet.email
    visit collaborators_url
    click_on I18n.t("collaborators.index.invite")

    fill_in "Email", with: collaborator_email
    click_on I18n.t("devise.invitations.new.submit_button")

    assert_current_path collaborators_path
    assert_text I18n.t("devise.invitations.send_instructions", email: collaborator_email)
  end
end