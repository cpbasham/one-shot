class ItemCategory < ActiveRecord::Base
  has_many :item_category_item_sets
  has_many :item_sets, through: :item_category_item_sets
  has_many :item_item_categories
  has_many :items, through: :item_item_categories
end
