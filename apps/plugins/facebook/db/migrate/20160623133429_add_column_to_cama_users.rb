class AddColumnToCamaUsers < ActiveRecord::Migration
  def change
  	add_column :cama_users, :provider, :string
  	add_column :cama_users, :oauth_token, :string
  	add_column :cama_users, :oauth_expires_at, :datetime
  end
end
