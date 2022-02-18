class ShoppingsController < ApplicationController

  def index
    fridge = Fridge.find(params[:fridge_id])
    @items = fridge.items.order(regular: :desc, amount_id: :asc)
    @shopping_form = ShoppingForm.new
  end

  def create
    @shopping_form = ShoppingForm.new(shopping_params)
    if @shopping_form.valid?
      @shopping_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shopping_params
    params.require(:shopping_form).permit(:shopping_date, :shoping_item_ids).merge(fridge_id: fridge_id, user_id: current_user.id)
end
