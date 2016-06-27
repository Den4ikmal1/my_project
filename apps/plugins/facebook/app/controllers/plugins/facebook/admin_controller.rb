class Plugins::Facebook::AdminController < CamaleonCms::Apps::PluginsAdminController
  include Plugins::Facebook::MainHelper
  def index
     @current_value = Plugins::Facebook::OmiauthSetting.last
  end
  def settings
    @current_value = Plugins::Facebook::OmiauthSetting.last
  end
  def saved
  	@app_id = params[:key]
  	@app_secret = params[:secret]
    begin 
      @sell = Plugins::Facebook::OmiauthSetting.create!(app_id: @app_id, app_secret: @app_secret)
    	flash[:notice] = "create"
    	redirect_to admin_plugins_facebook_index_path 
    rescue
      flash[:notice] = "can't be blank"
      render 'plugins/facebook/admin/settings'
    end
  end
end
