class Bidcart < ActiveRecord::Base

has_many :line_bids, :dependent => :destroy

def add_bidding(bidding_id)
current_bidding = line_bids.where(:bidding_id => bidding_id).first
if current_bidding
current_bidding.quantity += 1
else
current_bidding = LineBid.new(:bidding_id=>bidding_id)
line_bids << current_bidding
end
current_bidding
end

def total_price
line_bids.to_a.sum { |bidding| bidding.total_price }
end

def paypall_url(return_url)
  values = {
    :business => 'seller_1322995015_biz@gmail.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id
  }
  line_bids.each_with_index do |bidding, index|
    values.merge!({
      "amount_#{index+1}" => (bidding.total_price/bidding.quantity),
      "item_name_#{index+1}" => bidding.bidding.item_name,
      "item_number_#{index+1}" => bidding.id,
      "quantity_#{index+1}" => bidding.quantity
    })
  end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end



end
