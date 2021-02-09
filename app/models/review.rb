class Review < ApplicationRecord
  validates :rate, presence: true, numericality: { only_integer: true }
  belongs_to :souvenir
  validates :comment, presence: true
end
