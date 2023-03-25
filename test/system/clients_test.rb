require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:felipe)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New Client"

    fill_in "First name", with: @client.first_name
    fill_in "Last name", with: @client.last_name
    fill_in "Email", with: @client.email
    fill_in "Phone", with: @client.phone
    click_on "Create Client"

    assert_text "Client was sucessfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
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
    visit clients_url
    click_on "Destroy", match: :first

    assert_text "Client was successfully deleted"
  end
end
