require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end
  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "全てのカラムに値が入っていると登録できる" do
        expect(@user_order).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it "クレジットカード情報が入ってない時" do
        @user_order.token = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号がないとき" do
        @user_order.post_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post number can't be blank")
      end
      it "都道府県がない時" do
        @user_order.sender_id = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Sender can't be blank")
      end
      it "市区町村がない時" do
        @user_order.municipality = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地がない時" do
        @user_order.address = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号がない時" do
        @user_order.phone_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end