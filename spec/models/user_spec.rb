require 'rails_helper'
RSpec.describe 'ユーザーモデル機能', type: :model do
  let(:user) { FactoryBot.create(:user) }
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(name: '', content: '失敗テスト', user: user)
        expect(task).not_to be_valid
      end
    end
  end
end
