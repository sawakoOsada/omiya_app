# require 'rails_helper'

RSpec.describe 'カート管理機能', type: :system do
  # let!(:user) {FactoryBot.create(:user)}
  let!(:souvenir) {FactoryBot.create(:souvenir)}
  let!(:cart) {FactoryBot.create(:cart)}
  let!(:cart_item) {FactoryBot.create(:cart_item, cart: cart)}

  describe '商品をカートに入れる機能' do
    context 'カートに入れるをクリックした場合' do
      it 'カート内商品が表示される' do
        visit souvenirs_path(souvenir.id)
        fill_in '数量', with: '1'
        click_on 'カートに入れる'
        expect(page).to have_content 'souvenir_sample1'
      end
      it '指定した個数でカートに入る' do
        visit souvenirs_path(souvenir.id)
        fill_in '数量', with: '2'
        click_on 'カートに入れる'
        expect(page).to have_content '2個'
      end
    end

    context '既にカート内にある商品をカートに入れた場合' do
      before do
        # cart_in
      end
      it '指定した個数が追加される' do
        visit souvenirs_path(souvenir.id)
        fill_in '数量', with: '1'
        click_on 'カートに入れる'
        expect(page).to have_content '2個'
      end
    end

    context '別のページに遷移した場合' do
      it 'カート内情報が保持される' do
        # cart_in
        visit current_cart
        expect(page).to have_content 'souvenir_sample1'
      end
    end
  end

  describe 'カート一覧機能' do
    context '個数を指定し変更するをクリックした場合' do
      it '指定した個数に更新する' do
        # cart_in
        find_by_id('cart_item_quantity').select '2'
        click_on '変更'
        expect(page).to have_content '2個'
      end
    end
  end

  describe '商品購入機能' do
    context 'カート内に商品がある場合' do
      it '商品を購入できる' do
        # cart_in
        click_on 'カードで支払う'
        fill_in 'cardnumber', with: '4242424242424242'
        expect(page).to have_content '支払いが完了しました'
      end
    end

    context 'カート内に商品がない場合' do
      it 'カート内に商品がないと表示される' do
        visit current_cart
        expect(page).to have_content 'ないよ'
      end
    end
  end
end
