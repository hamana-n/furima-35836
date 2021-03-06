require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'nicknameがなければ登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailがなければ登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include'Email has already been taken'
      end
      it '@を含まないemailだと登録できない' do
        @user.email = 'aaaaaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include'Password is too short (minimum is 6 characters)'
      end
      it "passwordが半角英数字混合でなければ登録できない(英字のみのパスワードは保存できない)" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
      end
      it "passwordが半角英数字混合でなければ登録できない(数字のみのパスワードは保存できない)" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
      end
      it "全角文字を含むパスワードは保存できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
      end
      it 'first_nameがなければ登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'last_nameがなければ登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'first_name_kanaがなければ登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it 'last_name_kanaがなければ登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include"First name is invalid"
      end
      it "last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include"Last name is invalid"
        end
      it "first_name_kanaのフリガナは全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "かな"
        @user.valid?
       expect(@user.errors.full_messages).to include"First name kana is invalid"
     end
        it "last_name_kanaのフリガナは全角（カタカナ）でなければ登録できない" do
        @user.last_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include"Last name kana is invalid"
      end
      it 'birthdayがなければ登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end


