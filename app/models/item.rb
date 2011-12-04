class Item < ActiveRecord::Base

  belongs_to :user
  has_many :biddings
  has_many :notifications
  has_many :assets

  accepts_nested_attributes_for :assets, :allow_destroy => true
  validates_numericality_of :item_price, :on => :update, :greater_than => 10


  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item

  if line_items.count.zero?
    return true
  else
    errors[:base] << "Line Items present"
    return false

end
end


   attr_accessible :users_id
   attr_accessible :item_name
   attr_accessible :item_desc
   attr_accessible :item_price
   attr_accessible :item_cond
   attr_accessible :auction_end
   attr_accessible :category_name
   attr_accessible :category_id
   attr_accessible :flags
   attr_accessible :id
   attr_accessible :assets_attributes

  def self.search(search)
    if search
      where('item_name LIKE ?', "%#{search}%")
    else
    scoped
    end
  end




end
