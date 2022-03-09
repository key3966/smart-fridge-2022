class ShoppingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_items, only: [:index, :create]
  before_action :set_fridge, only: [:index, :create]
  before_action :same_fridge?, only: [:index, :create]

  def index
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
    params.require(:shopping_form).permit(:shopping_date, shopping_item_ids: []).merge(fridge_id: params[:fridge_id],
                                                                                       user_id: current_user.id)
  end

  def set_items
    @items = Item.order('amount_id asc', 'category_id asc', 'regular desc', 'exp_date asc')
  end

  def set_fridge
    @fridge = Fridge.find(params[:fridge_id])
  end

  def same_fridge?
    redirect_to root_path unless current_user.fridge_id == Fridge.find(params[:fridge_id]).id
  end
end
