FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'ぜんかく' }
    last_name             { 'ぜんかく' }
    first_name_kana       { 'ゼンカクカナ' }
    last_name_kana        { 'ゼンカクカナ' }
    birth_day             { '2021-01-01' }
  end
end
