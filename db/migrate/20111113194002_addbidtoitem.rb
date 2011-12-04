class Addbidtoitem < ActiveRecord::Migration
  def change
    change_table :items do |t|

    t.references :bidding
      end

  end
end
