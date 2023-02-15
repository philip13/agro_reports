require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get clients_url
    assert_response :success
  end

  test 'should get new' do
    get new_client_url
    client = @controller.view_assigns['client']
    assert_equal client.new_record?, true
    assert_response :success
  end

  test 'should create client' do
    assert_difference('Client.count') do
      post clients_url, params: { 
        client: { 
          first_name: 'Juan', last_name: 'Samches', email: 'juan@mail.com', phone: '341 111 2233'
        } 
      }
    end

    assert_redirected_to client_url(Client.last)
  end

  test 'should not create client' do
    post clients_url, params: {
      client: {
        first_name: nil, last_name: nil, email: nil, phone: nil
      }
    }
    assert_response :unprocessable_entity
  end

  setup do
    @client = clients(:felipe)
  end

  test 'should show client' do
    get client_url(@client)
    assert_equal @client, @controller.view_assigns['client']
    assert_response :success
  end

  test 'should get edit' do
    get edit_client_url(@client)
    assert_equal @client, @controller.view_assigns['client']
    assert_response :success
  end

  test 'should update client' do
    patch client_url(@client), params: {
      client: {
        first_name: "#{@client.first_name} update", 
        last_name: "#{@client.last_name} update"
      }
    }
    
    assert_redirected_to client_url(@client)
    assert_equal "#{@client.first_name} update", @controller.view_assigns['client'].first_name
  end

  test 'should not update client' do
    patch client_url(@client), params: {
      client: {
        email: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'should destroy client' do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
    assert_response :see_other
  end
end