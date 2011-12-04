class Search < ActiveRecord::Base

  def items
    @items ||= find_items
  end


  def auctionreports
    @auctionreports ||= find_auctionreports

  end

  def openauctoins
    @openauctoins ||= find_newopenauctions
  end

  def closedauctions
     @closedauctions ||=find_closedauctions
  end

  private

  def find_items
    items = Item.order(:item_name)
    items = items.where("item_name Like ?", "%#{keyword}%") if keyword.present?
    items = items.where(category_id: category_id) if category_id.present?
    items = items.where("item_price >= ?", min_price) if min_price.present?
    items = items.where("item_price <= ?", max_price) if max_price.present?
    items
  end

  def find_auctionreports
    items = Item.order(:item_name)
    items = items.where(category_id: category_id) if category_id.present?
    items = items.where("created_at >= ?", auction_start) if auction_start.present?
    items = items.where("auction_end <= ?", auction_end) if auction_end.present?
    items
  end

    def find_newopenauctions
    items = Item.order(:item_name)
    items = items.where(category_id: category_id) if category_id.present?
    items = items.where("created_at >= ?", auction_start) if auction_start.present?
    items = items.where("created_at <= ?", auction_end) if auction_end.present?
    items
    end

  def find_closedauctions
    items = Item.order(:item_name)
    items = items.where(category_id: category_id) if category_id.present?
    items = items.where("auction_end >= ?", auction_start) if auction_start.present?
    items = items.where("auction_end <= ?", auction_end) if auction_end.present?
    items
  end

end

