require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.create(:request)
    sleep 0.1
  end

  describe '新規共有リクエスト' do
    context '共有リクエストができる場合' do
      it '冷蔵庫IDが入力されていてユーザーが紐づいていればリクエストができる' do
        expect(@request).to be_valid
      end
    end
    context '共有リクエストができない場合' do
      it '冷蔵庫IDが入力されていなければリクエストができない' do
        @request.fridge_id = ''
        @request.valid?
        expect(@request.errors.full_messages).to include('冷蔵庫IDを入力してください')
      end
      it '存在する冷蔵庫のIDでない限りリクエストができない' do
        @request.fridge_id = '999999999999999999999'
        @request.valid?
        expect(@request.errors.full_messages).to include('冷蔵庫IDを入力してください')
      end
      it 'ユーザーが紐づいてなければリクエストができない' do
        @request.user = nil
        @request.valid?
        expect(@request.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
