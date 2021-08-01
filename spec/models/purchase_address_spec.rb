require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code、prefecture_id、municipal、address、phone_number、tokenがあれば商品購入できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空のとき' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'prefecture_idが1のとき' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalが空のとき' do
        @purchase_address.municipal = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Municipal can't be blank"
      end
      it 'addressが空のとき' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'pshone_numberが空のとき' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank", "Phone number is invalid."
      end
      it 'postal_codeにハイフンが含まれていないとき' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'postal_codeが全角で入力されているとき' do
        @purchase_address.postal_code = '１２３−４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '電話番号の数値が12桁以上のとき' do
        @purchase_address.phone_number = '123456789123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid."
      end
      it '電話番号が全角で入力されているとき' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid."
      end
      it 'tokenが空では登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end