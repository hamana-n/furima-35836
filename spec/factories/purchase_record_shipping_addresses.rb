FactoryBot.define do
  factory :purchase_record_shipping_address do

    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 00000000000 }
    token {"tok_abcdefghijk00000000000000000"}

    
    
  end
end






