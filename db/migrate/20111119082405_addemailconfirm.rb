class Addemailconfirm < ActiveRecord::Migration
  def change
    add_column :users, :email_confirmation, :email_confirmation
  end
end
