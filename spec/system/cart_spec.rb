require 'rails_helper'
RSpec.describe 'カート管理機能', type: :system do

  let!(:user) {FactoryBot.create(:user)}
  let!(:souvenir) {FactoryBot.create(:souvenir)}
  let!(:souvenir2) {FactoryBot.create(:souvenir2)}
  let!(:cart) {FactoryBot.create(:cart)}
  let!(:cart_item) {FactoryBot.create(:cart_item, cart: cart)}

  describe '商品をカートに入れる機能' do

    context 'カートに入れるをクリックした場合' do
      it '指定した商品と個数が表示される' do
        cart_in(souvenir, 2)
        expect(page).to have_content 'souvenir_sample1'
        expect(page).to have_content '2個'
      end

    context '別のページに遷移した場合' do
      it 'カート内情報が保持される' do
        cart_in(souvenir, 1)
        visit cart_path(cart.id)
        expect(page).to have_content 'souvenir_sample1'
      end
    end
  end

    context '既にカート内に商品がある場合' do
      before do
        cart_in(souvenir, 1)
      end
      it '同じ商品は指定した個数が追加される' do
        cart_in(souvenir, 1)
        expect(page).to have_content '2個'
      end
      it '違う商品は別途追加される' do
        cart_in(souvenir2, 1)
        expect(page).to have_content 'souvenir_sample1'
        expect(page).to have_content 'souvenir_sample2'
      end
    end
  end

  describe 'カート一覧機能' do

    context '個数を指定し変更するをクリックした場合' do
      it '指定した個数に更新する' do
        cart_in(souvenir, 1)
        find_by_id('cart_item_quantity').select '2'
        click_button '変更'
        expect(page).to have_content '2個'
      end
    end

    context 'カート内に商品がない場合' do
      it 'カート内に商品がないと表示される' do
        visit cart_path(cart.id)
        expect(page).to have_content '商品を探しに行きましょう！'
      end
    end
  end

  describe '商品購入機能' do
    before do
      cart_in(souvenir, 1)
      user.confirm
    end
    context '住所登録したユーザーでログインした場合' do
      let!(:address) {FactoryBot.create(:address, user: user)}
      it '商品を購入できる' do
        sign_in user
        visit cart_path(cart.id)
        click_button '購入確認'
        click_button 'カードで支払う'
        within_frame find('iframe') do
          fill_in 'payjp_cardNumber', with: '4242424242424242'
          fill_in 'payjp_cardExpiresMonth', with: '01'
          fill_in 'payjp_cardExpiresYear', with: '30'
          fill_in 'payjp_cardCvc', with: '111'
          fill_in 'payjp_cardName', with: address.name
          click_button 'カードで支払う'
        end
        expect(page).to have_content '支払いが完了しました'
      end
    end

    context 'ユーザー登録されていない場合' do
      it '登録が必要だと表示される' do
        visit cart_path(cart.id)
        expect(page).to have_content '商品購入には会員登録が必要です'
      end
    end

    context 'ユーザーの住所が登録されていない場合' do
      it '住所登録が必要だと表示される' do
        sign_in user
        visit cart_path(cart.id)
        expect(page).to have_content '商品購入には住所登録が必要です'
      end
    end
  end
end
