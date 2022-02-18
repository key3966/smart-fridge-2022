require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム新規登録' do
    context '新規登録できるとき' do
      it 'regular, name, category_id, amount_id, exp_dateがあれば登録できる' do
        expect(@item).to be_valid
      end
      it 'exp_dateが空でも登録できる' do
        @item.exp_date = ''
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'fridgeが紐づいてないと登録できない' do
        @item.fridge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Fridge must exist')
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'カテゴリーを選択しなければ登録できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '残量を選択しなければ登録できない' do
        @item.amount_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Amount can't be blank")
      end
      #it '賞味/消費期限が今日より前の日付だと登録できない' do
        #@item.exp_date = Faker::Date.backward
        #@item.valid?
        #expect(@item.errors.full_messages).to include('Exp date は今日以降を選択してください')
      #end
    end
  end
end
