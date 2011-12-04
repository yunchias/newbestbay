class Changeadmindetails < ActiveRecord::Migration
  def self.up

        # Create a default user
    AdminUser.create!(:email => 'bestbaysoftware@gmail.com', :username => 'bestbaysoftware', :password => 'genxadmin', :password_confirmation => 'genxadmin')

   # add_index :admin_users, :email,                :unique => true
    #add_index :admin_users, :reset_password_token, :unique => true
    # add_index :admin_users, :confirmation_token,   :unique => true
    # add_index :admin_users, :unlock_token,         :unique => true
    # add_index :admin_users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :admin_users
  end
end
