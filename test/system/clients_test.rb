require 'application_system_test_case'

class ClientTest < ApplicationSystemTestCase
  setup do
    @client = clients(:felipe)
  end

  test 'visiting the index' do
    visit clients_url
    assert_selector 'h1', text: 'Clients'
    assert_selector 'a', text: 'New Client'
    assert_selector 'div.full-name', text: "#{@client.first_name} #{@client.last_name}"
    assert_selector 'div.email', text: "#{@client.email}"
    assert_selector 'div.phone', text: "#{@client.phone}"
  end

  test 'should create client' do
    visit clients_url
    click_on 'New Client'

    fill_in 'First name', with: @client.first_name
    fill_in 'Last name', with:@client.last_name
    fill_in 'Email', with: @client.email
    fill_in 'Phone', with: @client.phone
    click_on 'Create Client'

    assert_text 'Client was sucessfully created'
    click_on 'Back'
  end
end