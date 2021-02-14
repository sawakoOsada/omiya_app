require 'rails_helper'
RSpec.describe '商品閲覧機能', type: :system do

  let!(:souvenir) {FactoryBot.create(:souvenir)}
  let!(:souvenir2) {FactoryBot.create(:souvenir2)}

  describe '一覧表示機能' do

    context '一覧画面に遷移した場合' do
      it '商品一覧が表示される' do
        visit souvenirs_path
        expect(page).to have_content 'souvenir_sample1'
        expect(page).to have_content 'souvenir_sample2'
      end
    end

    context '商品名で検索した場合' do
      it '一致する商品が表示される' do
        visit souvenirs_path
        fill_in 'q_name_cont', with: 'souvenir_sample1'
        click_button '検索'
        expect(page).to have_content 'souvenir_sample1'
        expect(page).not_to have_content 'souvenir_sample2'
      end
    end

    context '県名を選択した場合' do
      it '一致する商品が表示される' do
        visit souvenirs_path
        select '北海道', from: 'q[prefecture_id_eq]'
        click_button '検索'
        expect(page).to have_content 'souvenir_sample1'
      end
    end

    context '商品名を入力し県名を選択した場合' do
      it '両方に一致する商品が表示される' do
        visit souvenirs_path
        fill_in 'q_name_cont', with: 'souvenir_sample1'
        select '北海道', from: 'q[prefecture_id_eq]'
        click_button '検索'
        expect(page).to have_content 'souvenir_sample1'
      end
    end
  end

  describe '詳細表示機能' do

    context '任意の商品詳細画面に遷移した場合' do
      it '該当商品の内容が表示される' do
        visit souvenir_path(souvenir.id)
        expect(page).to have_content 'souvenir_sample1'
      end
    end
  end
end
