require "test_helper"

class ClientFlowsTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:user1)
    @account = user.account
    sign_in user
    get "/"
  end

  test "show a list of clients" do
    get "/accounts/#{@account.id}/clients"

    assert_select "h1", I18n.t("clients.index.title")
    assert_select "tbody" do
      assert_select "tr", Client.count
    end
  end

  test "create a client" do
    get "/accounts/#{@account.id}/clients/new"
    assert_response :success

    post "/accounts/#{@account.id}/clients", params: {client: {
      first_name: "John",
      last_name: "Smit",
      email: "john@gmail.com",
      phone: "32156677"
    }}

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", I18n.t("flash.message.resource_created", resource: I18n.t("models.client"))
  end

  setup do
    @client = clients(:two)
  end

  test "update a client" do
    get edit_account_client_path(@account, @client)
    assert_response :success

    patch account_client_path(@account, @client), params: {client: {first_name: "Phillip"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", I18n.t("flash.message.resource_updated", resource: I18n.t("models.client"))
  end

  test "destroy a client" do
    assert_difference("Client.count", -1) do
      delete account_client_path(@account, @client)
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end

    assert_select "div", I18n.t("flash.message.resource_deleted", resource: I18n.t("models.client"))
  end
end
