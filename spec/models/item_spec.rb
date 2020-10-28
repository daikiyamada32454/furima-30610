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
      it "商品名が40文字以内なら保存できる" do
        @item.name = "aaaaaaa"
        expect(@item).to be_valid
      end
      it "説明が1000字までなら保存できる" do
        @item.description = "aaaaaaa"
        expect(@item).to be_valid
      end
      it "値段が300円から9,999,999円であれば保存される" do
        @item.price = 1000
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
    end
  end
end
