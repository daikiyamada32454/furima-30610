class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :aftter_buy
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :deliverydate
  belongs_to_active_hash :sender
  belongs_to_active_hash :status

  validates :name, :description, :category, :status, :delivery_charge, :sender, :delivery_date, :price, presence: true
  validates :description_id, :category_id, :status_id, :delivery_charge_id, :sender_id, :delivery_date_id, numericality: { other_than: 1 }  
end
