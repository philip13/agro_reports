require "test_helper"

class ClientFlowsTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user1)
  end

  test "show a list of clients" do
    get "/clients"

    assert_select "h1", "Clients"
    assert_select "tbody" do
      assert_select "tr", Client.count
    end
  end

  test "create a client" do
    get "/clients/new"
    assert_response :success

    post "/clients", params: {client: {
      first_name: "John",
      last_name: "Smit",
      email: "john@gmail.com",
      phone: "32156677"
    }}

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "Client was sucessfully created"
  end

  setup do
    @client = clients(:felipe)
  end

  test "update a client" do
    get edit_client_path(@client)
    assert_response :success

    patch client_path(@client), params: {client: {first_name: "Phillip"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "Client was successfully update"
  end

  test "destroy a client" do
    assert_difference("Client.count", -1) do
      delete client_path(@client)
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end

    assert_select "div", "Client was successfully deleted"
  end
end
