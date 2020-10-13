FactoryBot.define do
  factory :purchase_address do
    post_code { '111-1111' }
    prefecture_id { '2' }
    city  { Faker::Address.city }
    other { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.extension(length: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
