class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item_id, index: true

      t.timestamps null: false
    end
  end
end
