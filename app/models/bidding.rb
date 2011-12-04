class Bidding < ActiveRecord::Base
  belongs_to :user
  has_many :assets
  belongs_to :item
  has_many :line_bids

  before_destroy :ensure_not_referenced_by_any_line_bid

def ensure_not_referenced_by_any_line_bid
  if line_bids.count.zero?
  return true
  else
  errors[:base] << "Line Bids present"
  return false
  end
  end


  accepts_nested_attributes_for :assets, :allow_destroy => true

   accepts_nested_attributes_for :item
  attr_accessible :assets_attributes

  attr_accessible :item_name
  attr_accessible :item_desc
  attr_accessible :item_cond
  attr_accessible :bid_status
  attr_accessible :bid_price
  attr_accessible :item_id
  attr_accessible :item_price
  attr_accessible :items_attributes



end



