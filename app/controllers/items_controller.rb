class ItemsController < ApplicationController

   def index
    @item = Item.order("id")
   end 

   def new
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
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to action: :index
    end
   end 

   def update
     @item = Item.find(params[:id])
     if  @item.update(item_params)
      redirect_to item_path
    else
     render:edit
    end
   end
  private
  def item_params
  params.require(:item).permit(:image,:name, :category_id, :status_id, :shippingcharges_id , :sender_id, :scheduleddelivery_id, :price, :description).merge(user_id: current_user.id)
  end
end

