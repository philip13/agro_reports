require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:felipe)
    @user = users(:user1)
    @account = @user.account
    sign_in @user
  end

  test "visiting the index" do
    visit account_clients_path(@account)
    assert_selector "h1", text: I18n.t("clients.index.title")
  end

  test "should create client" do
    visit new_account_client_path(@account)

    fill_in "client[first_name]", with: @client.first_name
    fill_in "client[last_name]", with: @client.last_name
    fill_in "client[email]", with: @client.email
    fill_in "client[phone]", with: @client.phone

    model = I18n.t("activerecord.models.client")
    click_on I18n.t("helpers.submit.create", model: model)

    assert_text "Client was sucessfully created"
    click_on I18n.t("back")
  end

  test "should update Client" do
    visit account_client_path(@account, @client)
    click_on "Edit"

    fill_in "client[first_name]", with: @client.first_name
    fill_in "client[last_name]", with: @client.last_name
    fill_in "client[email]", with: @client.email
    fill_in "client[phone]", with: @client.phone

    model = I18n.t("activerecord.models.client")
    click_on I18n.t("helpers.submit.update", model: model)

    assert_text "Client was successfully update"
    click_on I18n.t("back")
  end

  test "should destroy Client" do
    visit account_clients_path(@account)
    click_on I18n.t("destroy"), match: :first

    assert_text "Client was successfully deleted"
  end

  test "non-logged in user can't see clients" do
    sign_out :user
    visit account_clients_path(@account)

    assert_text I18n.t("devise.failure.unauthenticated")
    assert_selector "h2", text: I18n.t("devise.sessions.new.title")
  end
end
