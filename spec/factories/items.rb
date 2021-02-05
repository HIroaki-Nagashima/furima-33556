FactoryBot.define do
  factory :item do
    name             { '名前' }
    explanation      { '説明' }
    category_id      { 2 }
    state_id         { 2 }
    barden_id        { 2 }
    area_id          { 2 }
    day_id           { 2 }
    price            { 9999 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
