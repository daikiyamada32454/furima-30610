class UserOrder
  
  include ActiveModel::Model
  attr_accessor :post_number, :sender_id, :municipality , :building_name,:address, :phone_number, :user_id, :item_id, :order_id
  
  with_options presence: true do
    validates :post_number
    validates :sender_id
    validates :municipality
    validates :address
    validates :phone_number
  end

  def save
    order = Order.create(user_id:user_id, item_id:item_id)
    StreetAddress.create(post_number: post_number, sender_id: sender_id, municipality: municipality, building_name: building_name, address: address, phone_number: phone_number, order_id: order.id)
  end
end
