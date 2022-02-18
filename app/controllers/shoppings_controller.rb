class ShoppingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fridge, only: [:index, :create]

  def index
    @items = fridge.items.order(regular: :desc, amount_id: :asc)
    @shopping_form = ShoppingForm.new
  end

  def create
    @shopping_form = ShoppingForm.new(shopping_params)
    if @shopping_form.valid?
      @shopping_form.save
      redirect_to root_path
    else
      @items = fridge.items.order(regular: :desc, amount_id: :asc)
      render :index
    end
  end

  private

  def shopping_params
    params.require(:shopping_form).permit(:shopping_date, shopping_item_ids:[]).merge(fridge_id: params[:fridge_id], user_id: current_user.id)
  end

  def set_fridge
    fridge = Fridge.find(params[:fridge_id])
  end
end
