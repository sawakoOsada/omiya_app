require 'rails_helper'
RSpec.describe '住所モデル機能', type: :model do

  let!(:user) { FactoryBot.create(:user) }

  describe 'バリデーションのテスト' do

    context '氏名、住所がある場合' do
      it '有効である' do
        address = FactoryBot.build(:address, user: user)
        expect(address).to be_valid
      end
    end

    context '郵便番号がない場合' do
      it '無効である' do
        address = FactoryBot.build(:address, user: user, zip: nil)
        expect(address).not_to be_valid
      end
    end

    context '県がない場合' do
      it '無効である' do
        address = FactoryBot.build(:address, user: user, prefecture_id: nil)
        expect(address).not_to be_valid
      end
    end

    context '市区町村がない場合' do
      it '無効である' do
        address = FactoryBot.build(:address, user: user, city: nil)
        expect(address).not_to be_valid
      end
    end

    context '町域がない場合' do
      it '無効である' do
        address = FactoryBot.build(:address, user: user, town: nil)
        expect(address).not_to be_valid
      end
    end
  end
end
