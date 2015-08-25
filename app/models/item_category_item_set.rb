class ItemCategoryItemSet < ActiveRecord::Base
  belongs_to :item_category
  belongs_to :item_set
end
