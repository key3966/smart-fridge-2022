class LossesController < ApplicationController
  before_action :authenticate_user!

  def create
    @loss_items = LossItems.new(loss_params)
    if @loss_items.valid?
      @loss_items.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def loss_params
    params.permit(:loss_date, :fridge_id, :item_id, :amount_id)
  end
end
