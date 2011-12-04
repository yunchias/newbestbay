class Addenddatetoitems < ActiveRecord::Migration
  def change
    add_column :items, :auction_end, :datetime
  end
end
