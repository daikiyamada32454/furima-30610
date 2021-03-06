class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
   def index
    @item = Item.order("id")
   end 

   def new
    unless user_signed_in?
      redirect_to root_path
    end
    @item = Item.new
   end

   def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
    unless current_user == @item.user
      redirect_to action: :index
    end
   end 

   def update
     if  @item.update(item_params)
      redirect_to item_path
     else
      render:edit
     end
   end

   def destroy
    if current_user.id == @item.user_id
     if @item.destroy
      redirect_to root_path
     else
      render:edit
     end
   end
  end
  private
  def item_params
  params.require(:item).permit(:image,:name, :category_id, :status_id, :shippingcharges_id , :sender_id, :scheduleddelivery_id, :price, :description).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end

