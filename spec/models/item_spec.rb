require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample1.png')
    end
    context '商品出品できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品できないとき' do
      it '商品名が空だと登録できない' do
        @item.product_name = ""
        @item.valid?
      expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it '商品の説明が空だと登録できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'カテゴリーが--だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it '商品の状態が空だと登録できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it '商品の状態が--だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end
      it '発送料の負担が空だと登録できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden can't be blank"
      end
      it '発送料の負担が--だと登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden must be other than 1"
      end
      it '発送元の地域が空だと登録できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '発送元の地域が--だと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end
      it '発送までの日数が空だと登録できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it '発送までの日数が--だと登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day must be other than 1"
      end
      it '価格が空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '価格が全角だと登録できない' do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number"
      end
      it '価格の範囲が¥300以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it '価格の範囲が¥9999999以上だと登録できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it '価格が半角英数混合だと登録できない' do
        @item.price = 'aa11'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number"
      end
      it '価格が半角英語だと登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number"
      end

  end
 end
end