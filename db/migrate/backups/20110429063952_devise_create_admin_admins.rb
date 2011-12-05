class DeviseCreateAdminAdmins < ActiveRecord::Migration
  def self.up
    create_table(:admin_admins) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both


      t.timestamps
    end

    add_index :admin_admins, :email,                :unique => true
    add_index :admin_admins, :reset_password_token, :unique => true
    add_index :admin_admins, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :admin_admins
  end
end
