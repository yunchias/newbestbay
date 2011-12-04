class Addfieldstobidding < ActiveRecord::Migration
  def change

    add_column :biddings, :item_name, :string
    add_column :biddings, :item_desc, :string
    add_column :biddings, :item_cond, :string
    add_column :biddings, :bid_status, :string
  end
end
