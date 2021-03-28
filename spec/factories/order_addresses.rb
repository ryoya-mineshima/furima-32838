FactoryBot.define do
  factory :order_address do
    post_cord       {"123-4567"}
    prefecture_id   {1}
    city            {"千葉市"}
    address         {"中央区"}
    phone_number    {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
