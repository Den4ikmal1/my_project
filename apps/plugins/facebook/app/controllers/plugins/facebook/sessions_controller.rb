class Plugins::Facebook::SessionsController < CamaleonCms::Apps::PluginsFrontController
 	
 	def create
 	  @user = Plugins::Facebook::Facebook.from_omniauth(request.env['omniauth.auth'], request.env['omniauth.auth']['uid'])

  	login_user(@user)
  	cama_register_user(user_data = params[:user], params[:meta])
 	end

  def destroy
  	cookies.delete(:auth_token, domain: :all)
    cookies.delete(:auth_token, domain: nil)
    c_data = {value: nil, expires: 24.hours.ago}
    c_data[:domain] = :all if PluginRoutes.system_info["users_share_sites"].present? && CamaleonCms::Site.count > 1
    cookies[:auth_token] = c_data
    redirect_to params[:return_to].present? ? params[:return_to] : cama_root_path
  end

  def setup
    request.env['omniauth.strategy'].options[:client_id] = Plugins::Facebook::OmiauthSetting.last.app_id
    request.env['omniauth.strategy'].options[:client_secret] = Plugins::Facebook::OmiauthSetting.last.app_secret
    render :text => "Setup complete.", :status => 404
  end

  def cama_sign_in?
    !cama_current_user.nil?
  end

  def login_user(user, remember_me = false, redirect_url = nil)
    c = {value: [user.auth_token, request.user_agent, request.ip], expires: 24.hours.from_now}
    c[:domain] = :all if PluginRoutes.system_info["users_share_sites"].present? && CamaleonCms::Site.count > 1
    c[:expires] = 1.month.from_now if remember_me

    user.update({last_login_at: Time.zone.now})
    cookies[:auth_token] = c

    # user redirection
    flash[:notice] = t('camaleon_cms.admin.login.message.success', locale: current_site.get_admin_language)
    if redirect_url.present?
      redirect_to redirect_url
    elsif (return_to = cookies.delete(:return_to)).present?
      redirect_to return_to
    else
      redirect_to cama_root_path
    end
  end

   def cama_register_user(user_data, meta)
    @user = current_site.users.new(user_data)
    r = {user: @user, params: params}; hook_run('user_before_register', r)

    if current_site.security_user_register_captcha_enabled? && !cama_captcha_verified?
      {:result => false, :type => :captcha_error, :message => t('camaleon_cms.admin.users.message.error_captcha')}
    else
      if @user.save
        @user.set_metas(meta)
        message = current_site.need_validate_email? ? t('camaleon_cms.admin.users.message.created_pending_validate_email') : t('camaleon_cms.admin.users.message.created')
        r = {user: @user, message: message, redirect_url: cama_admin_login_path}; hooks_run('user_after_register', r)
        {:result => true, :message => r[:message], :redirect_url => r[:redirect_url]}
      else
        {:result => false, :type => :no_saved}
      end
    end
  end


  

end
	   