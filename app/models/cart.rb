class Cart < ActiveRecord::Base

has_many :line_items, :dependent => :destroy

def add_item(item_id)
current_item = line_items.where(:item_id => item_id).first
if current_item
current_item.quantity += 1
else
current_item = LineItem.new(:item_id => item_id)
line_items << current_item
end
current_item
end

def total_price
line_items.to_a.sum { |item| item.total_price }
end
def paypal_url(return_url, notify_url)
  values = {
    :business => 'seller_1322957185_biz@gmail.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id,
    :notify_url => notify_url
  }
  line_items.each_with_index do |item, index|
    values.merge!({
      "amount_#{index+1}" => (item.total_price/item.quantity),
      "item_name_#{index+1}" => item.item.item_name,
      "item_number_#{index+1}" => item.id,
      "quantity_#{index+1}" => item.quantity
    })
  end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end



end
