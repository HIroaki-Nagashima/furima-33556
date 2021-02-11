FactoryBot.define do
  factory :order_furima do
    postal_code {'123-4567'}
    area_id     {1}
    municipalty {'横浜市緑区'}
    adress      {'青山1-1-1'}
    phone_number{"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
