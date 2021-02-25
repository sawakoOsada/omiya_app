class Review < ApplicationRecord
  validates :rate, presence: true
  belongs_to :souvenir
  belongs_to :user
end
