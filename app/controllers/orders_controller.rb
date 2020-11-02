class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @userorder = UserOrder.new
  end

  def create
  # binding.pry
    @user_order = UserOrder.new(userorder_params)
    if @user_order.valid?
      @user_order.save
      redirect_to action: :index
    else
      render action: :index
    end
  end
  private

  def userorder_params
    params.permit(:post_number, :sender_id, :municipality,  :building_name, :address, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end