class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :aftter_buy
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :Shippingcharges
  belongs_to_active_hash :ScheduledDelivery
  belongs_to_active_hash :sender
  belongs_to_active_hash :status

  with_options presence: true do
  validates :name
  validates :description
  validates :category_id
  validates :status_id
  validates :shippingcharges_id
  validates :sender_id
  validates :scheduleddelivery_id
  validates :price, format: {with:/\A[0-9]+\z/}
  end
  validates :category_id, :status_id, :shippingcharges_id, :sender_id, :scheduleddelivery_id, numericality: { other_than: 1 }  
end
