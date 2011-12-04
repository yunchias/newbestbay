class AddQuantityToLineBid < ActiveRecord::Migration
  def self.up
  add_column :line_bids, :quantity, :integer, :default => 1
  end
  def self.down
    remove_column :line_bids, :quantity
    end

end
