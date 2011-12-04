class Addpricetobidding < ActiveRecord::Migration
  def change

    add_column :biddings, :bid_price, :decimal
  end
end
