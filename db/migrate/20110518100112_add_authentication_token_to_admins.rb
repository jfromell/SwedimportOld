class AddAuthenticationTokenToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admin_admins, :authentication_token, :string
    add_index :admin_admins, :authentication_token, :unique => true
  end

  def self.down
    remove_column :admin_admins, :authentication_token
  end
end
