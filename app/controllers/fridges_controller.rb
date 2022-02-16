class FridgesController < ApplicationController
  def index
    @fridge = Fridge.new
    @item = Item.new
    @items = current_user.fridge.items
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

  def update
  end

  private

  def fridge_params
    params.require(:fridge).permit(:title)
  end
end
