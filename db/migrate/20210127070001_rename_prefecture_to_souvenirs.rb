class RenamePrefectureToSouvenirs < ActiveRecord::Migration[5.2]
  def change
    rename_column :souvenirs, :prefecture, :prefecture_id
  end
end
