require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @user_order = FactoryBot.build(:user_order, user_id:@user.id, item_id:@item.id)
      sleep 0.1
    end
    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
    end  

    context '商品購入ができない時' do
      it '郵便番号が空だと保存できないこと' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
    
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと保存できないこと' do
        @user_order.area_id= nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Area can't be blank")
      end
      it '都道府県が--だと保存できないこと' do
        @user_order.area_id= 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Area must be other than 1")
      end
      it '市区町村が空だと保存できないこと' do
        @user_order.municipality= nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @user_order.address= nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'が空だと保存できないこと' do
        @user_order.phone_number= nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上だと保存できないこと' do
        @user_order.phone_number= '012345678910'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
       it "user_idが空では登録できないこと" do
        @user_order.user_id= nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end


   end
 end
end