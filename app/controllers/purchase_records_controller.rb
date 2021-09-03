class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id != @item.user_id
    redirect_to root_path if @item.purchase_record.present?
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_shipping_address_params)
    if @purchase_record_shipping_address.valid?

      pay_item

      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_record_shipping_address_params
    params.require(:purchase_record_shipping_address).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_record_id).merge(token: params[:token], item_id:params[:item_id], user_id: current_user.id)
  end




  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: purchase_record_shipping_address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end


end
