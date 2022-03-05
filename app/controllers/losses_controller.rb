class LossesController < ApplicationController
  before_action :authenticate_user!

  def create
    @loss_item = LossItem.new(loss_params)
    if @loss_item.valid?
      @loss_item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def loss_params
    params.permit(:loss_date, :fridge_id, :item_id, :amount_id, :category_id)
  end
end
