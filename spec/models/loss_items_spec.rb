require 'rails_helper'

RSpec.describe LossItem, type: :model do
  before do
    fridge = FactoryBot.create(:fridge)
    item = FactoryBot.create(:item)
    @loss_item = FactoryBot.build(:loss_item, fridge_id: fridge.id, item_id: item.id)
    sleep 0.1
  end


  describe 'ロス情報登録' do
    context '登録できる場合' do
      it 'ロスの日付と冷蔵庫、アイテムが紐づいていて残量があり、日用品以外なら登録できる' do
        expect(@loss_item).to be_valid
      end
    end

    context '登録できない場合' do
      it '日付が入っていないと登録できない' do
        @loss_item.loss_date = nil
        @loss_item.valid?
        expect(@loss_item.errors.full_messages).to include("Loss date can't be blank")
      end

      it '冷蔵庫が紐づいていなければ登録できない' do 
        @loss_item.fridge_id = nil
        @loss_item.valid?
        expect(@loss_item.errors.full_messages).to include("Fridge can't be blank")
      end

      it 'アイテムが紐づいていなければ登録できない' do 
        @loss_item.item_id = nil
        @loss_item.valid?
        expect(@loss_item.errors.full_messages).to include("Item can't be blank")
      end
      
      it '日用品はロスにできない' do
        @loss_item.category_id = 5
        @loss_item.valid?
        expect(@loss_item.errors.full_messages).to include("Category is can't be loss")
      end

      it '残量がなければロスにできない' do
        @loss_item.amount_id = 1
        @loss_item.valid?
        expect(@loss_item.errors.full_messages).to include("Amount is nothing")
      end
    end
  end
end
