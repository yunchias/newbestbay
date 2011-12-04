class Addpaymentinfotousers < ActiveRecord::Migration
  def change
    add_column :users, :cardno, :integer
    add_column :users, :typecard, :string
    add_column :users, :expirydate, :date
    add_column :users, :ccv, :integer

  end
end
