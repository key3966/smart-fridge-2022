require 'rails_helper'

RSpec.describe ShoppingForm, type: :model do
  before do
    fridge = FactoryBot.create(:fridge)
    user = FactoryBot.create(:user)
    item1 = FactoryBot.create(:item)
    item2 = FactoryBot.create(:item)
    @shopping_form = FactoryBot.build(:shopping_form, fridge_id: fridge.id, user_id: user.id,
                                                      shopping_item_ids: [item1.id, item2.id])
    sleep 0.1
  end

  describe '買い物機能' do
    context '買い物できる場合' do
      it '日付とアイテムにチェックが入っていれば買い物できる' do
        expect(@shopping_form).to be_valid
      end
    end

    context '購入できない場合' do
      it '日付を入力しないと買い物できない' do
        @shopping_form.shopping_date = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include('購入日を入力してください')
      end
      it 'アイテムに一つもチェック入っていないと買い物できない' do
        @shopping_form.shopping_item_ids = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include('最低一つ以上の購入商品を選択してください')
      end
      it '冷蔵庫が紐付いてなければ購入できない' do
        @shopping_form.fridge_id = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include('Fridgeを入力してください')
      end
      it 'ユーザーが紐付いてなければ購入できない' do
        @shopping_form.user_id = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
