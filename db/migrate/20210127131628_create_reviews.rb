class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :souvenir, foreign_key: true
      t.text :comment
      t.float :rate
      t.timestamps
    end
  end
end
