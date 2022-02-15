class FridgesController < ApplicationController
  def index
    @fridge = Fridge.new
  end

  def create
    @fridge = Fridge.new(fridge_params)
    if @fridge.save
      user = User.find(current_user.id)
      user.update(fridge_id: @fridge.id)
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def fridge_params
    params.require(:fridge).permit(:title)
  end

end
