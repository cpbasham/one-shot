class CreateItemCategoryItemSets < ActiveRecord::Migration
  def change
    create_table :item_category_item_sets do |t|
      t.belongs_to :item_category
      t.belongs_to :item_set

      t.timestamps null: false
    end
  end
end
