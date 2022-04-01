class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request, only: [:update, :destroy]
  before_action :same_fridge?, only: [:update, :destroy]

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path, success: '共有リクエストを申請しました'
    else
      render_top
    end
  end

  def update
    if @request.user.update(fridge_id: @request.fridge_id)
      @request.destroy
      redirect_to root_path, success: '共有リクエストを承認しました'
    else
      render_top
    end
  end

  def destroy
    @request.destroy
    redirect_to root_path, danger: '共有リクエストを拒否しました'
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
    # 優先順位：常備アイテム、残量、賞味/消費期限順
    @items = @q.result(distinct: true)
    render template: 'fridges/index'
  end

  def same_fridge?
    # 共有リクエストを同じ冷蔵庫のユーザー以外が操作するとリダイレクトされる処理
    unless @request.fridge_id == current_user.fridge_id || @request.fridge_id == current_user.request.fridge_id
      redirect_to root_path
    end
  end
end
