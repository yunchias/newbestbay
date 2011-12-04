class LineBid < ActiveRecord::Base

belongs_to :bidding
belongs_to :bidcart

def total_price
bidding.bid_price * quantity
end


end
