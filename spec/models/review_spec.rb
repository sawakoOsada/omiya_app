require 'rails_helper'
RSpec.describe 'レビューモデル機能', type: :model do

  let!(:souvenir) { FactoryBot.create(:souvenir) }

  describe 'バリデーションのテスト' do

    context 'レビューに星とコメントがある場合' do
      it '有効である' do
        review = FactoryBot.build(:review, souvenir: souvenir)
        expect(review).to be_valid
      end
    end

    context 'レビューの星がない場合' do
      it '無効である' do
        review = FactoryBot.build(:review, rate: nil, souvenir: souvenir)
        expect(review).not_to be_valid
      end
    end

    context 'レビューのコメントがない場合' do
      it '有効である' do
        review = FactoryBot.build(:review, comment: nil, souvenir: souvenir)
        expect(review).to be_valid
      end
    end
  end
end
