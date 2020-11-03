class OrdersController < ApplicationController
  before_action :item_params, only: [:index, :create]
  def index
    @userorder = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(userorder_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private
  def pay_item 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: userorder_params[:token],
      currency: 'jpy'
    )
  end
  
  def userorder_params
    params.permit(:post_number, :sender_id, :municipality,  :building_name, :address, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def item_params
    @item = Item.find(params[:item_id])
  end
end