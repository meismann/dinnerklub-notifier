FactoryGirl.define do
  factory :omni_auth_auth_hash, class: OmniAuth::AuthHash do
    provider 'facebook'
    uid      '123456'
    info({
      name:       'Joe Bloggs',
      urls: { Facebook: 'http://www.facebook.com/jbloggs' }
    })
  end
end
