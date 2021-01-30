class Review < ApplicationRecord
  belongs_to :souvenir
  validates :comment, presence: true
end
