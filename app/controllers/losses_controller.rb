class LossesController < ApplicationController
  before_action :authenticate_user!

  def create
    @loss_items = LossItems.new(loss_params)
    @loss_items.save
    redirect_to root_path
  end

  private
  def loss_params
    params.require(:loss_items).permit(:loss_date, :fridge_id, :item_id)
  end
end
