class Plugins::Facebook::Facebook < ActiveRecord::Base
  belongs_to :site, class_name: "CamleonCms::Site"

  self.table_name = 'cama_users'
  def self.from_omniauth(auth)

  	user = Plugins::Facebook::Facebook.create!(email: auth.email,  provider: auth.provider,  password_digest: '12345678')
	  
	end

end