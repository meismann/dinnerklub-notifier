FactoryGirl.define do
  factory :omni_auth_auth_hash, class: OmniAuth::AuthHash do
    provider 'facebook'
    uid      '123456'
    info({
      email:      'joe@bloggs.com',
      name:       'Joe Bloggs',
      first_name: 'Joe',
      last_name:  'Bloggs',
      urls: { Facebook: 'http://www.facebook.com/jbloggs' }
    })
  end
end
