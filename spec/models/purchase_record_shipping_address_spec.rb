require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  before do

    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_shipping_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_record_shipping_address.building_name = ''
        expect(@purchase_record_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_record_shipping_address.postal_code = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_shipping_address.postal_code = '1234567'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'shipping_area_idを選択していないと保存できないこと' do
        @purchase_record_shipping_address.shipping_area_id = 1
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'municipalityが空だと保存できないこと' do
        @purchase_record_shipping_address.municipality = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_record_shipping_address.address = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_record_shipping_address.phone_number = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角数値以外だと保存できないこと' do
        @purchase_record_shipping_address.phone_number = '２０００'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('Phone number is invalid')
      end
      it "tokenが空では登録できないこと" do
        @purchase_record_shipping_address.token = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
  






