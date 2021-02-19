class Address < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_id
  validates :name, presence: true
  validates :zip, presence: true, length: { is: 7 }, numericality: { only_integer: true }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :town, presence: true
  belongs_to :user

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_id).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
