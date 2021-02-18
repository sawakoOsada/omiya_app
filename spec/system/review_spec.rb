require 'rails_helper'
RSpec.describe 'レビュー管理機能', type: :system do

  let!(:souvenir) {FactoryBot.create(:souvenir)}
  let!(:review) {FactoryBot.create(:review, souvenir: souvenir)}

  describe '投稿機能' do

    context 'レビューを新規作成した場合' do
      it '作成したレビューが一覧表示される' do
        visit souvenir_path(souvenir.id)
        first("img[src*='star-off-cf9b07584547d5d561dfac9cdbf7b6a530cb72a1b7a1096411966036c4017d38.png']").click
        fill_in 'review_comment', with: 'review_test'
        click_button '投稿する'
        sleep 1
        expect(page).to have_content 'review_test'
      end
    end
  end

  describe '編集機能' do

    context 'レビューを編集した場合' do
      it 'レビューの内容が変更される' do
        visit souvenir_path(souvenir.id)
        click_link '編集'
        fill_in "review_comment_#{souvenir.id}", with: 'review_edited'
        click_button '更新する'
        sleep 1
        expect(page).to have_content 'review_edited'
      end
    end
  end

  describe '削除機能' do

    context 'レビューを削除した場合' do
      it 'レビューが一覧から削除される' do
        visit souvenir_path(souvenir.id)
        click_link '削除'
        page.accept_alert
        expect(page).not_to have_content 'comment_test'
      end
    end
  end
end
