FactoryBot.define do
  factory :item do
    name                           {'試験'}
    detail                         {'試験'}
    category_id                    {2}
    status_id                      {2}
    burden_of_shipping_charge_id   {2}
    shipping_area_id               {2}
    days_to_ship_id                {2}
    price                          {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end

  end
end


