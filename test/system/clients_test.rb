require 'application_system_test_case'

class ClientTest < ApplicationSystemTestCase
  setup do
    @client = clients(:felipe)
  end

  test 'visiting the index' do
    visit clients_url
    assert_selector 'h1', text: 'Clients'
    assert_selector 'a', text: 'New Client'
    # assert_dom_equal  %{<a href='/clients/new'>New Client</a>}

    assert_selector 'div.full_name', text: "#{@client.first_name} #{@client.last_name}"
    assert_selector 'div.email', text: "#{@client.email}"
    assert_selector 'div.phone', text: "#{@client.phone}"

    click_on 'New Client'
  end
end