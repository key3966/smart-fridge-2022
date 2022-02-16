class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render template: 'fridges/index'
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:regular, :name, :category_id, :amount_id, :exp_date).merge(fridge_id: current_user.fridge_id)
  end
end
