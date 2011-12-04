class LineItem < ActiveRecord::Base

belongs_to :item
belongs_to :cart

def total_price
item.item_price * quantity
end


end
