class Item < ActiveRecord::Base
  has_many :item_item_categories
  has_many :item_categories, through: :item_item_categories
end