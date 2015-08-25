class CreateItemSets < ActiveRecord::Migration
  def change
    create_table :item_sets do |t|
      t.references :user
      t.string :name
      t.string :champion
      t.string :map
      t.string :game_type

      t.timestamps null: false
    end
  end
end
