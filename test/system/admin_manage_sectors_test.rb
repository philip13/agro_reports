require "application_system_test_case"

class AdminManageSectorsTest < ApplicationSystemTestCase
  setup do
    @user = users(:user1)
    @account = accounts(:account1)
    @client = clients(:felipe)
    @berries = crops(:berries)

    sign_in @user
  end

  test "visiting sectors index page" do
    visit account_client_sectors_path(@account, @client)
    assert_selector "h1", text: I18n.t("sectors.index.title")
  end

  test "should create sectors" do
    visit new_account_client_sector_path(@account, @client)

    fill_in "Name", with: "Sector 1"
    select @berries.name, from: "Crop"
    page.select @berries.name, from: 'Crop'
    fill_in "Phenological state", with: "Germinacion"

    click_on "Create Sector"
    assert_text "Sector was successfully created"
  end
end
