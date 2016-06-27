module Plugins::Facebook::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def facebook_on_active(plugin)
  end

  # here all actions on going to inactive
  # plugin: plugin model
  def facebook_on_inactive(plugin)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def facebook_on_upgrade(plugin)
  end

  def my_function_for_extra_login(args)
    args[:html] = render partial: theme_view("plugins/facebook/admin/my_extra_login")
  end
end
