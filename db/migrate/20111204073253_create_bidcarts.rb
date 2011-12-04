class CreateBidcarts < ActiveRecord::Migration
  def change
    create_table :bidcarts do |t|

      t.timestamps
    end
  end
end
