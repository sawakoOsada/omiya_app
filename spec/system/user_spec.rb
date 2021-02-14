require 'rails_helper'
RSpec.describe '商品閲覧機能', type: :system do

  let!(:user) {FactoryBot.create(:user)}

  describe '一覧表示機能' do

    context '一覧画面に遷移した場合' do
      it '商品一覧が表示される' do

        user.confirm
        sign_in user
        cart_in
        visit cart_path(cart.id)
        expect(page).to have_content '購入確認'
      end
    end
  end
end
