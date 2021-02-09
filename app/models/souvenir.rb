class Souvenir < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :reviews, dependent: :destroy
  has_one :cart_item, dependent: :destroy
end
