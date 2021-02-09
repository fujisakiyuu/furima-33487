FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    area_id { 1 }
    municipality { '東京都' }
    address { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    
    # after(:build) do |item|
    #   item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    # end

  end
end
