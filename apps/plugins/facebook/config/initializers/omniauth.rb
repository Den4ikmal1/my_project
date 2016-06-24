OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "595507010631157", "9209f03341a058a4a6f983b4db2fc6ae", scope: 'email', info_fields: 'email,name,first_name,last_name,gender'
end