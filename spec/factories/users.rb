FactoryBot.define do
  factory :user do
    nickname              { 'フリマ太郎' }
    email                 { Faker::Internet.free_email }
    password              { 'AAaa11' }
    password_confirmation { password }
    first_name            { '太郎'}
    last_name             { '山田'}
    first_name_kana       { 'タロウ'}
    last_name_kana        { 'ヤマダ'}
    birth_date            { '1990-11-24' }
  end
end