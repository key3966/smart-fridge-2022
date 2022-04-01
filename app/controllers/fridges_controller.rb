class FridgesController < ApplicationController
  def index
    @fridge = Fridge.new
    @item = Item.new
    @request = Request.new
    @q = Item.ransack(params[:q])
    @q.sorts = ['amount_id desc', 'category_id asc', 'exp_date asc', 'regular desc']
    # 残量：少ない→多い カテゴリ：生鮮→日用品 賞味期限：昇順 常備アイテム：チェックが優先
    @items = @q.result(distinct: true)
  end

  def create
    @fridge = Fridge.new(fridge_params)
    @user = User.find(current_user.id)
    if @fridge.save
      @user.update(fridge_id: @fridge.id)
      redirect_to root_path, success: '冷蔵庫を作成しました'
    else
      render :index
    end
  end

  private

  def fridge_params
    params.require(:fridge).permit(:title)
  end
end
