class Addassetstobidding < ActiveRecord::Migration
  def change
    change_table :assets do |t|

    t.integer :bidding_id
    end
    end
end
