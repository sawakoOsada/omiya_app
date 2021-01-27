class AddPrefectureToSouvenirs < ActiveRecord::Migration[5.2]
  def change
    add_column :souvenirs, :prefecture, :integer
  end
end
