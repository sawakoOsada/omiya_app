require 'rails_helper'
RSpec.describe 'ユーザーモデル機能', type: :model do

  describe 'バリデーションのテスト' do

    context 'メールアドレス、パスワードがある場合' do
      it '有効である' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context 'メールアドレスがない場合' do
      it '無効である' do
        user = FactoryBot.build(:user, email: nil)
        expect(user).not_to be_valid
      end
    end

    context 'パスワードがない場合' do
      it '無効である' do
        user = FactoryBot.build(:user, password: nil)
        expect(user).not_to be_valid
      end
    end
  end
end
