class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items
  has_many :order

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
         validates :nickname 
         validates :family_name, format: { with:/\A[ぁ-んァ-ン一-龥]/} 
         validates :family_name_kana,format: { with:/\A[ァ-ヶー－]+\z/}
         validates :first_name,format: { with:/\A[ぁ-んァ-ン一-龥]/}
         validates :first_name_kana, format: { with:/\A[ァ-ヶー－]+\z/}
         validates :birthday 
         validates :password, format: { with:/\A[a-zA-Z0-9]+\z/}
         validates :password, length: { maximum: 12}
         end
end
