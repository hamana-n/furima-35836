FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'試験'}
    last_name             {'試験'}
    first_name_kana       {'テスト'}
    last_name_kana        {'テスト'}
    birthday              {'1994-10-27'}
  end
end

