class ItemSet < ActiveRecord::Base
  belongs_to :user
  has_many :item_category_item_sets
  has_many :item_categories, through: :item_category_item_sets

  validates :name, presence: true, allow_blank: true
end
