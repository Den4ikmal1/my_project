class Plugins::Facebook::AdminController < CamaleonCms::Apps::PluginsAdminController
  include Plugins::Facebook::MainHelper
  def index
    Rails.application.config.initializers.omniauth
  end
  def settings

  end
  def saved
  	@setting_key = params[:key]
  	@settings_secret = params[:secret]
  	flash[:notice] = "create"
  	redirect_to admin_plugins_facebook_index_path 
  end
end
