require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailに@がなければ登録できない' do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it '登録済みのemailでは登録できない' do
        @user.save
        any_user = FactoryBot.build(:user)
        any_user.email = @user.email
        any_user.valid?
        expect(any_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが６文字以下では登録できない' do
        @user.password = "Aa1"
        @user.password_confirmation = "Aa1"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password include both letters and numbers"
      end
      it 'passwordが英語のみ登録できない' do
        @user.password = "aaaAAA"
        @user.password_confirmation = "aaaAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password include both letters and numbers"
      end
      it 'passwordとpassword_confirmationが同じ出ないと登録できない' do
        @user.password = "AAaa11"
        @user.password_confirmation = "11aaAA"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordは確認用を入力しないと登録できない' do
        @user.password = "AAaa11"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが全角では登録できない' do
        @user.password = "AAAAAA"
        @user.password_confirmation = "AAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password include both letters and numbers"
      end
      it '苗字を入力しないと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it '名前を入力しないと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'ユーザー本名(名前)は全角(漢字、ひらがな、カタカナ)で入力しないと登録できない' do
        @user.first_name = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name full-width characters"
      end
      it 'ユーザー本名(苗字)は全角(漢字、ひらがな、カタカナ)で入力しないと登録できない' do
        @user.last_name = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name full-width characters"
      end
      it '苗字(かな)を入力しないと登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it '名前(かな)を入力しないと登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'ユーザー本名の(名前のかな)は全角カタカナでないと登録できない' do
        @user.first_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana full-width katakana characters"
      end
      it 'ユーザー本名の(苗字のかな)は全角カタカナでないと登録できない' do
        @user.last_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana full-width katakana characters"
      end
      it 'ユーザー本名の(名前のかな)はカタカナ以外の全角文字と登録できない' do
        @user.first_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana full-width katakana characters"
      end
      it 'ユーザー本名の(苗字のかな)はカタカナ以外の全角文字と登録できない' do
        @user.last_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana full-width katakana characters"
      end
      it '生年月日を入力しないと登録できない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end


    end
  end
end