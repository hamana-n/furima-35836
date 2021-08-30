require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '正常形' do
      it 'name,detail,category_id,status_id,burden_of_shipping_charge_id, shipping_area_id,days_to_ship_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '異常形' do
      it 'nameがなければ登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'detailがなければ登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end
      it 'category_idがなければ登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'status_idがなければ登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'burden_of_shipping_charge_idがなければ登録できない' do
        @item.burden_of_shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden of shipping charge can't be blank"
      end
      it 'shipping_area_idがなければ登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'days_to_ship_idがなければ登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'priceがなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "category_idが半角数字でなければ登録できない" do
        @item.category_id = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "status_idが半角数字でなければ登録できない" do
        @item.status_id = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "burden_of_shipping_charge_idが半角数字でなければ登録できない" do
        @item.burden_of_shipping_charge_id = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden of shipping charge can't be blank"
      end
      it "shipping_area_idが半角数字でなければ登録できない" do
        @item.shipping_area_id = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it "days_to_ship_idが半角数字でなければ登録できない" do
        @item.days_to_ship_id = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it "priceが半角数字でなければ登録できない" do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceが¥300~でなければ登録できない" do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "priceが~¥9,999,999でなければ登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 99999999"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include"Image can't be blank"
      end
      it 'category_idで1が入力されたら登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'status_idで1が入力されたら登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'burden_of_shipping_charge_idで1が入力されたら登録できない' do
        @item.burden_of_shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden of shipping charge can't be blank"
      end
      it 'shipping_area_idで1が入力されたら登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'days_to_ship_idで1が入力されたら登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
    end
  end
end

