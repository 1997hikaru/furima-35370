FactoryBot.define do
  factory :item do
    item_name             { 'パソコン' }
    explanation           { '3年前に購入したMacBookです' }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_cost_id      { 2 }
    prefecture_id         { 2 }
    days_delivery_id      { 2 }
    price                 { 50_000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end
