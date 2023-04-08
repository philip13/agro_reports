require "test_helper"

class InvitationResendsController < ActionDispatch::IntegrationTest
  test "should resend invitation" do
    user = users(:user1)
    sign_in user
    collaborator = users(:collaborator1)

    assert_emails 1 do
      collaborator.invite!
    end

    assert_emails 1 do
      post invititation_resends_path, params: {id: collaborator.id}
    end
  end
end
