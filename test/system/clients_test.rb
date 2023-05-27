require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:felipe)
    @user = users(:user1)
    @account = @user.account
    @model_client = I18n.t("models.client")

    sign_in @user
  end

  test "visiting the index" do
    visit account_clients_path(@account)
    assert_selector "h1", text: I18n.t("clients.index.title")
  end

  test "should create client" do
    visit new_account_client_url(@account)

    fill_in "client[first_name]", with: @client.first_name
    fill_in "client[last_name]", with: @client.last_name
    fill_in "client[email]", with: @client.email
    fill_in "client[phone]", with: @client.phone

    click_on I18n.t("helpers.submit.create", model: @model_client.downcase)

    assert_text I18n.t("flash.message.resource_created", resource: @model_client)
    click_on I18n.t("back")
  end

  test "should update Client" do
    visit account_client_path(@account, @client)
    click_on "Edit"

    fill_in "client[first_name]", with: @client.first_name
    fill_in "client[last_name]", with: @client.last_name
    fill_in "client[email]", with: @client.email
    fill_in "client[phone]", with: @client.phone

    click_on I18n.t("helpers.submit.update", model: @model_client.downcase)

    assert_text I18n.t("flash.message.resource_updated", resource: @model_client)
    click_on I18n.t("back")
  end

  test "should destroy Client" do
    visit account_clients_path(@account)
    all(:button, I18n.t("destroy")).last.click

    assert_text I18n.t("flash.message.resource_deleted", resource: I18n.t("models.client"))
  end

  test "non-logged in user can't see clients" do
    sign_out :user
    visit account_clients_path(@account)

    assert_text I18n.t("devise.failure.unauthenticated")
    assert_selector "h2", text: I18n.t("devise.sessions.new.title")
  end
end
