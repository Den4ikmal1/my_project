class Plugins::Facebook::OmiauthSetting < ActiveRecord::Base

	self.table_name = 'omiauth_settings'

	validates :app_id, :app_secret, presence: true
end
