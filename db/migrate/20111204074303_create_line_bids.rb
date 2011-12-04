class CreateLineBids < ActiveRecord::Migration
  def change
    create_table :line_bids do |t|
      t.integer :bidding_id
      t.integer :bidcart_id

      t.timestamps
    end
  end
end
