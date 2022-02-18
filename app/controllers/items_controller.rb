class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:update, :destroy]
  before_action :same_fridge?, only: [:update, :destroy]

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
    if @item.update(item_params)
      redirect_to root_path
    else
      @item = Item.new
      @items = current_user.fridge.items
      render template: 'fridges/index'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  
  private

  def item_params
    params.require(:item).permit(:regular, :name, :category_id, :amount_id, :exp_date).merge(fridge_id: current_user.fridge_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def same_fridge?
    redirect_to root_path unless @item.fridge_id == current_user.fridge_id
  end
end
