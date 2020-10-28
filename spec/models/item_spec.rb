require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品がうまくいく時' do
      it "全てのカラムに値が入っていると出品できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it "商品名前がないと保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明がないと保存出来ない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーがなければ保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "商品の状態がなければ保存できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "配送料についてが空の場合保存できない" do
        @item.shippingcharges_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingcharges is not a number")
      end
      it "配送元の情報が空の場合保存できない" do
        @item.sender_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender is not a number")
      end
      it "配送までの日時が空の場合保存できない" do
        @item.scheduleddelivery_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduleddelivery is not a number")
      end
      it "価格がなければ保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300円以下であれば保存されない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格が9999999円以上だと保存されない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格が半角数字出ないと保存されない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "category_idが１の時は保存されない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが１の場合保存されない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "scheduleddelivery_idが１の場合保存されない" do
        @item.scheduleddelivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduleddelivery must be other than 1")
      end
      it "sender_idが１の場合保存されない" do
          @item.sender_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Sender must be other than 1")
      end
      it "scheduleddelivery_idが１の場合保存されない" do
        @item.scheduleddelivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduleddelivery must be other than 1")
      end
      it "画像がないと保存されない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
