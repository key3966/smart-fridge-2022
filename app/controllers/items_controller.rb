class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = current_user.fridge.items
      render template: 'fridges/index'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      @item = Item.new
      @items = current_user.fridge.items
      render template: 'fridges/index'
    end
  end

  private

  def item_params
    params.require(:item).permit(:regular, :name, :category_id, :amount_id, :exp_date).merge(fridge_id: current_user.fridge_id)
  end
end
