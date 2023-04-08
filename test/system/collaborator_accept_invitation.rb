require "application_system_test_case"

class CollaboratorAcceptInvitation < ApplicationSystemTestCase
  test "create user account" do
    collaborator = users(:collaborator1)
    collaborator.invite!
    token = collaborator.raw_invitation_token

    visit accept_user_invitation_url(invitation_token: token)

    fill_in User.human_attribute_name(:name), with: collaborator.name
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on I18n.t("devise.invitations.edit.submit_button")

    assert_current_path root_path
  end
end
