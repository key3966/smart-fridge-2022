class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:update, :destroy]
  before_action :same_fridge?, only: [:update, :destroy]

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, success: 'アイテムを登録しました'
    else
      redirect_to root_path, danger: "アイテムの登録に失敗しました：<br>#{@item.errors.full_messages.join(',')}"
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, success: 'アイテムを更新しました'
    else
      redirect_to root_path, danger: "アイテムの更新に失敗しました：<br>#{@item.errors.full_messages.join(',')}"
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, success: 'アイテムを削除しました'
  end

  private

  def item_params
    params.require(:item).permit(:regular, :name, :category_id, :amount_id, :exp_date).merge(fridge_id: current_user.fridge_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def same_fridge?
    # アイテムに紐づく冷蔵庫IDとユーザーの冷蔵庫IDが一致しなければリダイレクトする
    redirect_to root_path unless @item.fridge_id == current_user.fridge_id
  end
end
