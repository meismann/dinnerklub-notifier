FactoryGirl.define do
  factory :user do
    uid        '666'
    provider   'twitter'
    name  'Hugo Lachaise'

    trait :matching_auth_hash do
      hash = FactoryGirl.build :omni_auth_auth_hash

      provider    hash.provider
      uid         hash.uid
      name        hash.info.name
    end
  end
end
