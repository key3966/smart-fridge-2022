class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request, only: [:update, :destroy]
  before_action :same_fridge?, only: [:update, :destroy]

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
    else
      render_top
    end
  end

  def update
    if @request.user.update(fridge_id: @request.fridge_id)
      @request.destroy
      redirect_to root_path
    else
      render_top
    end
  end

  def destroy
    @request.destroy
    redirect_to root_path
  end

  private

  def request_params
    params.require(:request).permit(:fridge_id, :user_id)
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def render_top
    @q = Item.ransack(params[:q])
    @q.sorts = ['regular desc', 'amount_id asc', 'exp_date asc']
    @items = @q.result(distinct: true)
    render template: 'fridges/index'
  end 

  def same_fridge?
    redirect_to root_path unless @request.fridge_id == current_user.fridge_id || @request.fridge_id == current_user.request.fridge_id
  end
end
