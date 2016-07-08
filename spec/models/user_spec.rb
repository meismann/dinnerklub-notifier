require 'rails_helper'

RSpec.describe User do

  describe '.from_omniauth' do

    it 'does not save a new user if it finds an existing match' do
      user = FactoryGirl.create :user, :matching_auth_hash
      expect {
        User.from_omniauth(build(:omni_auth_auth_hash))
      }.not_to change{
        User.count
      }
    end

    it 'updates names when facebook sends altered data' do
      user = FactoryGirl.create :user, :matching_auth_hash
      altered_data = build(:omni_auth_auth_hash).deep_merge(
        info: {
          name:  'Hans Glück',
          urls: { Facebook: 'http://www.facebook.com/hgluek' }
        }
      )
      expect {
        User.from_omniauth altered_data
      }.not_to change{
        User.count
      }
      user.reload
      expect(user.name).to eq 'Hans Glück'
      expect(user.fb_path).to eq 'hgluek'
    end
  end
end
