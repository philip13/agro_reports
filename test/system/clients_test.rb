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

    fill_in "First name", with: @client.first_name
    fill_in "Last name", with: @client.last_name
    fill_in "Email", with: @client.email
    fill_in "Phone", with: @client.phone
    click_on "Create Client"

    assert_text "Client was sucessfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit account_client_path(@account, @client)
    click_on "Edit"

    fill_in "First name", with: @client.first_name
    fill_in "Last name", with: @client.last_name
    fill_in "Email", with: @client.email
    fill_in "Phone", with: @client.phone
    click_on "Update Client"

    assert_text "Client was successfully update"
    click_on "Back"
  end

  test "should destroy Client" do
    visit account_clients_path(@account)
    click_on "Destroy", match: :first

    assert_text "Client was successfully deleted"
  end

  test "non-logged in user can't see clients" do
    sign_out :user
    visit account_clients_path(@account)

    assert_text I18n.t("devise.failure.unauthenticated")
    assert_selector "h2", text: "Login"
  end
end
