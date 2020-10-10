FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    introduction {Faker::Lorem.sentence}
    price {"300"}
    category_id {"2"}
    postage_payer_id {"2"}
    shipping_area_id {"2"}
    shipment_day_id {"2"}
    status_id {"2"}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
