class Plugins::Facebook::Facebook < ActiveRecord::Base
  belongs_to :site, class_name: "CamleonCms::Site"

  self.table_name = 'cama_users'
  def self.from_omniauth(auth, uid)

	  		
			user = Plugins::Facebook::Facebook.where(provider: auth.provider, uid: uid).first
  		if user
  			user
	  	else
	  		Plugins::Facebook::Facebook.create!(email: auth['info']['email'], username: auth['info']['first_name'], auth_token: Plugins::Facebook::Facebook.generate_token, uid: uid, provider: auth.provider)
	  	end


	end

	
		def self.generate_token
    
      SecureRandom.urlsafe_base64(nil, false)
   
    end
 
end
