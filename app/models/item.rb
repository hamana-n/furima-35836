class Item < ApplicationRecord
  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :burden_of_shipping_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 100_000_000 }
  validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden_of_shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

end
