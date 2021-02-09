class CreateSouvenirs < ActiveRecord::Migration[5.2]
  def change
    create_table :souvenirs do |t|
      t.string :name, null: false
      t.text :image
      t.integer :price, null: false
      t.timestamps
    end
  end
end
