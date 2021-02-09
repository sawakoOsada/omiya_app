class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.integer :zip, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :town, null: false
      t.string :building
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
