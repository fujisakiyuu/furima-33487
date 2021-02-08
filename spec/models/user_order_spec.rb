require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '配達先住所' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
  
      expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'area_idが空だと保存できないこと' do
      @user_order.area_id= nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalityが空だと保存できないこと' do
      @user_order.municipality= nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @user_order.address= nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_order.phone_number= nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @user_order.phone_number= '012345678910'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it "tokenが空では登録できないこと" do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end