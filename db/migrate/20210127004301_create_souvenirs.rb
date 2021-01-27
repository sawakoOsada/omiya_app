class CreateSouvenirs < ActiveRecord::Migration[5.2]
  def change
    create_table :souvenirs do |t|
      t.string :name
      t.text :image
      t.integer :price
      t.timestamps
    end
  end
end
