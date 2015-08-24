class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :summoner
      t.string :password_hash
    end
  end
end
