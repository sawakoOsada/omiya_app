class CartItem < ApplicationRecord
  belongs_to :souvenir
  belongs_to :cart
end
