FactoryBot.define do
  factory :item do
    product_name            { '商品名' }
    explanation             { '商品の説明' }
    category_id             { 2 }
    state_id                { 2 }
    burden_id               { 2 } 
    area_id                 { 2 }
    day_id                  { 2 }
    price                   { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
