require "test_helper"

class ClientTest < ActiveSupport::TestCase
  def setup
    @client = clients(:felipe)
  end

  test 'invalid without first name' do
    @client.first_name = nil
    refute @client.valid?, 'Client is valid without firts name'
    assert_not_nil @client.errors[:first_name], 'no validation error for first name present'
  end
  
  test 'invalid without last name' do
    @client.last_name = nil
    refute @client.valid?, 'Client is valid without last name'
    assert_not_nil @client.errors[:last_name], 'no validation error for last name present'
  end

  test 'invalid without email' do
    @client.email = nil
    refute @client.valid?, 'Client is valid without email'
    assert_not_nil @client.errors[:email], 'no validation error for email'
  end

  test 'invalid without phone' do
    @client.phone = nil
    refute @client.valid?, 'Client is valid without phone number'
    assert_not_nil @client.errors[:phone], 'no validation error for phone'
  end

  test 'valid user' do
    assert @client.valid?
  end
end
