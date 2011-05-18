class Admin::Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :trackable, :validatable, :token_authenticatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :authentication_token
end
