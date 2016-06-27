Rails.application.routes.draw do

    scope PluginRoutes.system_info["relative_url_root"] do
      scope '(:locale)', locale: /#{PluginRoutes.all_locales}/, :defaults => {  } do

        match 'auth/:provider/callback', via: [:get, :post], to: 'plugins/facebook/sessions#create'
        match 'auth/failure', via: [:get, :post], to: redirect('/')
        match '/auth/facebook/setup' => 'plugins/facebook/sessions#setup', via: [:get]
        match 'signout', via: [:get, :post],  to: 'plugins/facebook/sessions#destroy', as: 'signout'
        # frontend
        namespace :plugins do
          namespace 'facebook' do
            get 'index' => 'front#index'
          end
        end
      end

      #Admin Panel
      scope 'admin', as: 'admin' do
        namespace 'plugins' do
          namespace 'facebook' do
            get 'index' => 'admin#index'
            get 'settings' => 'admin#settings'
            post 'saved' => 'admin#saved'
          end
        end
      end

      # main routes
      #scope 'facebook', module: 'plugins/facebook/', as: 'facebook' do
      #  Here my routes for main routes
      #end
    end
  end
