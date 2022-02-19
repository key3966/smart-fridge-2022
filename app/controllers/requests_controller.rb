class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request, only: [:update, :destroy]

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
    @item = Item.new
    @items = current_user.fridge.items if user_signed_in? && current_user.fridge.present?
    render template: 'fridges/index'
  end 
end
