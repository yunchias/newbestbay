class Addassettoprice < ActiveRecord::Migration
  def change
  change_table :assets do |t|

    t.integer :item_price
    end
    end
end
