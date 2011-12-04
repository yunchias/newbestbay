class Asset < ActiveRecord::Base
  belongs_to :item
  belongs_to :bidding
  has_attached_file :asset, :styles => {:large => "640x480", :medium => "300x300>", :thumb => "100x100>"}
end
