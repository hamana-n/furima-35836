class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_record, :token

  with_options presence: true do
    validates :municipality
    validates :address
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code , format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :shipping_area_id ,numericality: { other_than: 1 , message: "can't be blank"}
  end

  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  def save

    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end