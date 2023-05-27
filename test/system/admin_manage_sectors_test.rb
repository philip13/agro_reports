require "application_system_test_case"

class AdminManageSectorsTest < ApplicationSystemTestCase
  setup do
    @user = users(:user1)
    @account = accounts(:account1)
    @client = clients(:felipe)
    @berries = crops(:berries)
    @model_sector = I18n.t("activerecord.models.sector")
    sign_in @user
  end

  test "visiting sectors index page" do
    visit account_client_sectors_path(@account, @client)
    assert_selector "h1", text: I18n.t("sectors.index.title")
  end

  test "should create sectors" do
    visit new_account_client_sector_path(@account, @client)

    fill_in "sector[name]", with: "Sector 1"
    
    page.select @berries.name, from: "sector[crop_id]"
    fill_in "sector[phenological_state]", with: "Germinacion"

    click_on I18n.t("helpers.submit.create", model: I18n.t("models.sector"))
    assert_text I18n.t("flash.message.resource_created", resource: I18n.t("activerecord.models.sector"))
  end
end
