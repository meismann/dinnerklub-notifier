require 'rails_helper'

RSpec.feature 'Login with Omniauth (OAuth2)' do

  before do
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      :provider => 'twitter',
      :uid => '123545',
      info: {
        email: 'joe@bloggs.com',
        name: 'Joe Bloggs',
        first_name: 'Joe',
        last_name: 'Bloggs'
      }
    )
  end

  scenario 'creates and authenticates a new user' do
    visit '/'
    expect{
      click_link 'Mit Facebook anmelden'
    }.to change{
      User.count
    }.by 1
  end

end
