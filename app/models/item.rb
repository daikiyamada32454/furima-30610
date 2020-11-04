class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :shippingcharges
  belongs_to_active_hash :scheduleddelivery
  belongs_to_active_hash :sender
  belongs_to_active_hash :status

  with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :category_id
  validates :status_id
  validates :shippingcharges_id
  validates :sender_id
  validates :scheduleddelivery_id
  validates :price, format: {with:/\A[0-9]+\z/}
  validates_inclusion_of :price, in: 300..9999999
  end
  validates :category_id, :status_id, :shippingcharges_id, :sender_id, :scheduleddelivery_id, numericality: { other_than: 1 }  
end
