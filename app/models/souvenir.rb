class Souvenir < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_id

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  has_many :reviews, dependent: :destroy
  has_one :cart_item, dependent: :destroy

  mount_uploader :image, ImageUploader
end
