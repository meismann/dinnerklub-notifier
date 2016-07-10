Rails.application.config.middleware.use OmniAuth::Builder do
  case Rails.env
  when 'production', 'test'
    provider :facebook
  when 'development'
    provider :developer
  end
end

OmniAuth.config.logger = Rails.logger
