Rails.application.config.middleware.use OmniAuth::Builder do
  case Rails.env
  when 'production'
    provider :facebook
  when 'development', 'test'
    provider :developer
  end
end
