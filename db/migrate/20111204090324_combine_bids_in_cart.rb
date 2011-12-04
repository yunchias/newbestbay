class CombineBidsInCart < ActiveRecord::Migration
  def self.up
  # replace multiple items for a single product in a cart with a single item
  Bidcart.all.each do |bidcart|
  # count the number of each product in the cart
  sums = bidcart.line_bids.group(:bidding_id).sum(:quantity)
  sums.each do |bidding_id, quantity|
  if quantity > 1
  # remove individual items
  bidcart.line_bids.where(:bidding_id=>bidding_id).delete_all
  # replace with a single item
  bidcart.line_bids.create(:bidding_id=>bidding_id, :quantity=>quantity)
  end
  end
  end
  end

def self.down
# split items with quantity>1 into multiple items
LineBid.where("quantity>1").each do |linebid|
# add individual items
linebid.quantity.times do
LineBid.create :bidcart_id=>linebid.bidcart_id,
:bidding_id=>linebid.bidding_id, :quantity=>1
end
# remove original item
linebid.destroy
end
end


end
