class CreateItemItemCategories < ActiveRecord::Migration
  def change
    create_table :item_item_categories do |t|
      t.belongs_to :item
      t.belongs_to :item_category

      t.timestamps null: false
    end
  end
end
