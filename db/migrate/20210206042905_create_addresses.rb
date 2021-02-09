class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :zip
      t.integer :prefecture_id
      t.string :city
      t.string :building
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
