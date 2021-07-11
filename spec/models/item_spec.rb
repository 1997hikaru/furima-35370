require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '出品登録できるとき' do
      it 'item_name,explanation,category,condition,delively_cost,prefecture,days_delivery,priceがあれば登録できる' do
      expect(@item).to be_valid
      end
    end
    context '出品登録できないとき' do
      it 'item_nameが空のとき' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'explanationが空のとき' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが1のとき' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが1のとき' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'delivery_cost_idが1のとき' do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery cost can't be blank"
      end
      it 'prefecture_idが1のとき' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'days_delivery_idが1のとき' do
        @item.days_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days delivery can't be blank"
      end
      it 'priceが空のとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円未満のとき' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが10000000円以上のとき' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'priceが全角数字で入力されているとき' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが全角漢字で入力されているとき' do
        @item.price = '千'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
