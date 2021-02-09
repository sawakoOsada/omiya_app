class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable, :recoverable
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses
end
