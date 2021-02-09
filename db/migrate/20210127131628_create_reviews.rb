class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :souvenir, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comment
      t.float :rate, null: false
      t.timestamps
    end
  end
end
