require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録出来ない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_name_kanaが空だと登録出来ない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end  
      it "family_name_kanaは全角カタカナ出ないと登録出来ない" do
        @user.family_name_kana = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "family_nameが全角漢字、カタカナ、ひらがな出ないと登録出来ない" do
        @user.family_name ="aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      
      it "emailが重複していると登録出来ない" do
        @user.save
        another_user = @user
        another_user.email = @user.email
        another_user.valid?
      end
      it "emailに@がないと登録出来ない" do
        @user.email = "aaaa"
        @user.valid? 
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaは全角カタカナでなければ登録出来ない" do 
        @user.first_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "first_nameは全角漢字、カタカナ、ひらがな出なければ登録出来ない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      
      it "birthdayが空だと登録出来ない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "パスワードが空では登録が出来ない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが6文字以下では登録出来ない" do
        @user.password = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが数字のみでは登録出来ない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it " パスワードが英字のみでは登録出来ない" do
        @user.password = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
    context '新規登録がうまくいく時' do
      it "全てのカラムが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameがあれば登録できる" do
        @user.nickname = "あああ"
        expect(@user).to be_valid
      end
      it "family_nameが全角漢字、カタカナ、ひらがなであれば登録できる" do
      @user.family_name = "ああああ"
      expect(@user).to be_valid
      end
      it "family_name_kanaが全角カタカナあれば登録できる" do
        @user.family_name_kana = "アア"
        expect(@user).to be_valid
      end
      it "first_nameが全角漢字、カタカナ、ひらがなであれば登録できる" do
        @user.first_name = "ああああ"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
        @user.first_name = "アア"
        expect(@user).to be_valid
      end
      it "birthdayがあれば保存できる" do
        @user.birthday = "1991-1-1"
        expect(@user).to be_valid
      end
      it "passwordが６文字以上、英数字で大文字があれば保存できる" do
        @user.password = "aaaaA1"
        @user.password_confirmation = "aaaaA1"
        expect(@user). to be_valid
      end
    end
  end
  end
  