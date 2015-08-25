class ItemItemCategory < ActiveRecord::Base
  belongs_to :item
  belongs_to :item_category
end
