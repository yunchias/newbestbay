class Addfieldstoitems < ActiveRecord::Migration
  def change
    change_table :items do |t|

      t.string :item_name
      t.string :item_desc
      t.decimal :item_price
      t.string :item_cond
      t.references :user
    end
  end

end
