class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable, :recoverable
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, reject_if: :reject_addresses, allow_destroy: true
  def reject_addresses(attributed)
    attributed['name'].blank? &&
    attributed['zip'].blank? &&
    attributed['prefecture_id'].blank? &&
    attributed['city'].blank? &&
    attributed['town'].blank?
  end
end
