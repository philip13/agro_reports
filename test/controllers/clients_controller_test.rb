require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:user1)
    @account = user.account
    sign_in user
    get root_url
  end

  test "should get index" do
    get account_clients_url(@account)
    assert_response :success
  end

  test "should get new" do
    get new_account_client_url(@account)
    assert_response :success
  end

  test "should create client" do
    assert_difference("Client.count") do
      post account_clients_url(@account), params: {
        client: {
          first_name: "Juan", last_name: "Samches", email: "juan@mail.com", phone: "341 111 2233"
        }
      }
    end

    assert_redirected_to account_client_url(@account, Client.last)
  end

  test "should not create client" do
    post account_clients_url(@account), params: {
      client: {
        first_name: nil, last_name: nil, email: nil, phone: nil
      }
    }
    assert_response :unprocessable_entity
  end

  setup do
    @client = clients(:felipe)
  end

  test "should show client" do
    get account_clients_url(@account, @client)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_client_url(@account, @client)
    assert_response :success
  end

  test "should update client" do
    patch account_client_url(@account, @client), params: {
      client: {
        first_name: "#{@client.first_name} update",
        last_name: "#{@client.last_name} update"
      }
    }

    assert_redirected_to account_client_url(@account, @client)
  end

  test "should not update client" do
    patch account_client_url(@account, @client), params: {
      client: {
        email: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test "should destroy client" do
    assert_difference("Client.count", -1) do
      delete account_client_url(@account, @client)
    end

    assert_redirected_to account_clients_url(@account)
    assert_response :see_other
  end
end
