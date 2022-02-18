class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
    else
      @item = Item.new
      @items = current_user.fridge.items
      render template: 'fridges/index'
    end
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:fridge_id, :user_id)
  end

end
