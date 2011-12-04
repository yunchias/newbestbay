class CreateBiddings < ActiveRecord::Migration
  def change
    create_table :biddings do |t|
      t.references :user
      t.references :item
      t.decimal :item_price

      t.timestamps
    end
  end
end
