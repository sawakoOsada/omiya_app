require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do

  let!(:user) {FactoryBot.create(:user)}

  describe '新規作成機能' do

    context 'ユーザーを作成した場合' do
      it 'メールを送信したと表示される' do
        visit new_user_registration_path
        fill_in 'user_email', with: 'test@email.com'
        fill_in 'user_password', with: 'test_password'
        fill_in 'user_password_confirmation', with: 'test_password'
        click_button 'アカウント登録'
        expect(page).to have_content '本人確認用のメールを送信しました。'
      end
    end
  end

  describe 'セッション機能' do

    context 'ユーザーを作成した場合' do
      it 'ログインできる' do
        user.confirm
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'ログインしている場合' do
      before do
        user.confirm
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button 'ログイン'
      end
      it 'ユーザー編集できる' do
        visit edit_user_registration_path
        fill_in 'user_current_password', with: user.password
        fill_in 'user_addresses_attributes_0_name', with: 'user_name'
        fill_in 'user_addresses_attributes_0_zip', with: '1111111'
        select '青森県', from: 'user_addresses_attributes_0_prefecture_id'
        fill_in 'user_addresses_attributes_0_city', with: 'user_city'
        fill_in 'user_addresses_attributes_0_town', with: 'user_town'
        fill_in 'user_addresses_attributes_0_building', with: 'user_building'
        click_button '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
      it 'ログアウトできる' do
        find('.uk-navbar-toggle-icon').click
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
      it 'アカウント削除できる' do
        visit edit_user_registration_path
        click_button 'アカウント削除'
        page.driver.browser.switch_to.alert.accept
        page.accept_alert
        expect(page).to have_content 'アカウントを削除しました。'
      end
    end
  end
end
