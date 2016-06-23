class Plugins::Facebook::SessionsController < CamaleonCms::Apps::PluginsFrontController
 	def create
    @user = Plugins::Facebook::Facebook.from_omniauth(env["omniauth.auth"])
   	login_user(@user)
 		redirect_to plugins_facebook_index_url
  end

  def destroy
  	session[:user_id] = nil
    redirect_to plugins_facebook_index_url
  end

  private

  

end
	   