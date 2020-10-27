class ItemsController < ApplicationController

def index
end

def new
  @item = Item.new
end

def create
  @item = item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end



private

def item_params
  params.require(:item).permit(:title, :text, :category_id, :status_id, :deliverycharge_id, :sender_id, :delivery_date_id)
end
end
