class Addfieldstousers < ActiveRecord::Migration
  def change
    add_column :users, :purpose, :string
    add_column :users, :title, :string
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :zipcode, :integer
    add_column :users, :phonenumber, :integer
    add_column :users, :dateofbirth, :date
    add_column :users, :r_email, :email
    add_column :users, :username, :string
    add_column :users, :r_password, :password
    add_column :users, :secret_q, :string
    add_column :users, :secret_a, :string
    add_column :users, :status, :string
  end
end
