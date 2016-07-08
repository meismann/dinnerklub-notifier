require 'rails_helper'

RSpec.feature 'Login with Omniauth (OAuth2)' do

  context 'when authentication succeeds' do
    before do
      OmniAuth.config.mock_auth[:facebook] =
        build :omni_auth_auth_hash
    end

    scenario 'creates a new authenticated user' do
      visit '/'
      expect{
        click_link 'Mit Facebook anmelden'
      }.to change{
        User.count
      }.by 1

      new_user = User.last
      expect(new_user.uid).to eq '123456'
      expect(new_user.provider).to eq 'facebook'
      expect(new_user.name).to eq 'Joe Bloggs'
      expect(new_user.fb_path).to eq 'jbloggs'
    end

  end
end
