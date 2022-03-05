class FridgesController < ApplicationController

  def index
    @fridge = Fridge.new
    @item = Item.new
    @request = Request.new
    @q = Item.ransack(params[:q])
    @q.sorts = ['amount_id desc', 'category_id asc', 'exp_date asc', 'regular desc']
    @items = @q.result(distinct: true)
  end

  def create
    @fridge = Fridge.new(fridge_params)
    @user = User.find(current_user.id)
    if @fridge.save
      @user.update(fridge_id: @fridge.id)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def fridge_params
    params.require(:fridge).permit(:title)
  end

end
