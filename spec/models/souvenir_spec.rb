require 'rails_helper'
RSpec.describe '商品モデル機能', type: :model do

  describe 'バリデーションのテスト' do

    context '商品名、価格がある場合' do
      it '有効である' do
        souvenir = FactoryBot.build(:souvenir)
        expect(souvenir).to be_valid
      end
    end

    context '商品名がない場合' do
      it '無効である' do
        souvenir = FactoryBot.build(:souvenir, name: nil)
        expect(souvenir).not_to be_valid
      end
    end

    context '価格がない場合' do
      it '無効である' do
        souvenir = FactoryBot.build(:souvenir, price: nil)
        expect(souvenir).not_to be_valid
      end
    end
  end
end
