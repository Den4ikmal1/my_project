class AddColumUidToCamaUsers < ActiveRecord::Migration
  def change
  	add_column :cama_users, :uid, :string
  end
end
