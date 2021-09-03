class ShippingAddress < ApplicationRecord



  belongs_to :purchase_record
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden_of_shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

end
