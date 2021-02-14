class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :zip, presence: true, length: { is: 7 }, numericality: { only_integer: true }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :town, presence: true
  belongs_to_active_hash :prefecture
  belongs_to :user
end
