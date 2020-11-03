class UserOrder
  
  include ActiveModel::Model
  attr_accessor :post_number, :sender_id, :municipality , :building_name,:address, :phone_number, :user_id, :item_id, :order_id, :token
  
  with_options presence: true do
    validates :post_number, format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :sender_id
    validates :municipality
    validates :address
    validates :phone_number, format: {with:/\A[0-9]+\z/}
    validates :token
  end

  def save
    order = Order.create(user_id:user_id, item_id:item_id)
    StreetAddress.create(post_number: post_number, sender_id: sender_id, municipality: municipality, building_name: building_name, address: address, phone_number: phone_number, order_id: order.id)
  end
  validates :sender_id, numericality:{other_than: 1 }
end
