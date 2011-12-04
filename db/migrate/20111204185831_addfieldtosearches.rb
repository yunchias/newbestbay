class Addfieldtosearches < ActiveRecord::Migration
  def change
      add_column :searches, :auction_start, :datetime
      add_column :searches, :auction_end, :datetime
  end
end
