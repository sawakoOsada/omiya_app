class Order < ApplicationRecord
  enum state: { 注文済み: 0, 発送中: 1, 配達完了: 2 }
  belongs_to :user
  has_many :order_items, dependent: :destroy
end
