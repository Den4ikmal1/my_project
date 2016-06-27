OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, :setup => true, scope: 'email', info_fields: 'email,name,first_name,last_name,gender'
end