class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_record

  attr_accessor :token
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  # validates :phone_number, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 11 }
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :shipping_area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipality, presence: true
  validates :address, presence: true
 

  validates :token, presence: true


def save

  purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

  ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
end
end


