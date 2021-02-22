class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable, :recoverable
  has_many :addresses, dependent: :destroy
  has_many :orders
  accepts_nested_attributes_for :addresses, reject_if: :reject_addresses, allow_destroy: true
  def reject_addresses(attributed)
    attributed['name'].blank? &&
    attributed['zip'].blank? &&
    attributed['prefecture_id'].blank? &&
    attributed['city'].blank? &&
    attributed['town'].blank?
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.addresses.build(name: 'ゲスト太郎',
                          zip: 1111111,
                          prefecture_id: 1,
                          city: 'ゲスト市',
                          town: 'ゲスト町1-1-1')
    end
  end
end
