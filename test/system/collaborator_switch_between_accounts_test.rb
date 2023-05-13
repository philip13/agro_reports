require "application_system_test_case"

class CollaboratorSwitchBetweenAccounts < ApplicationSystemTestCase
  test "default workspace" do
    user = users(:user1)
    col_user = users(:collaborator1)
    col_user.invited_by = user
    col_user.save!

    sign_in col_user
    visit root_path

    assert_text "#{I18n.t("workspace")}: #{col_user.account.short_name}"

    find("[data-action='click->menu#toggle']").click
    click_on user.account.short_name

    assert_current_path account_path(user.account)
    assert_text "#{I18n.t("workspace")}: #{user.account.short_name}"
  end
end
