FactoryBot.define do
  factory :user do
    email                  { Faker::Internet.free_email }
    password               { 'aaa111' }
    password_confirmation  { 'aaa111' }
    nickname               { 'sample' }
    last_name              { '山田' }
    first_name             { '太郎' }
    last_name_reading      { 'ヤマダ' }
    first_name_reading     { 'タロウ' }
    birthday               { '1950-01-01' }
  end
end
