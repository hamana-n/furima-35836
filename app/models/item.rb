class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id
    validates :status_id
    validates :burden_of_shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
    validates :image
      with_options  numericality: { other_than: 1 , message: "can't be blank"} do
        validates :category_id
        validates :status_id
        validates :burden_of_shipping_charge_id
        validates :shipping_area_id
        validates :days_to_ship_id
      end
   end
  
   validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99_999_999 }


  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden_of_shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

end