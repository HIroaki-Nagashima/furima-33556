FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'teriofh387jkh458' }
    password_confirmation { password }
    last_name_zenkaku     { '田中' }
    first_name_zenkaku    { '誠' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'マコト' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2021-01-01') }
  end
end
