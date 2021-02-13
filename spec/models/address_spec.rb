require 'rails_helper'
RSpec.describe '住所モデル機能', type: :model do

  let!(:user) { FactoryBot.create(:user) }

  describe 'バリデーションのテスト' do

    context 'レビューに星とコメントがある場合' do
      it '有効である' do
        address = FactoryBot.build(:address, user: user)
        expect(address).to be_valid
