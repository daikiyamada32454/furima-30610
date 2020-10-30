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
   end

   def edit
   end

   def destroy
   end
  private
  def item_params
  params.require(:item).permit(:image,:name, :category_id, :status_id, :shippingcharges_id , :sender_id, :scheduleddelivery_id, :price, :description).merge(user_id: current_user.id)
  end
end

