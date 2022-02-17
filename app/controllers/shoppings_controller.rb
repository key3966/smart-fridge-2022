class ShoppingsController < ApplicationController

  def index
    fridge = Fridge.find(params[:fridge_id])
    @items = fridge.items.order(regular: :desc, amount_id: :asc)
  end

end
