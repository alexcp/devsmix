FactoryGirl.define do
  factory :user do
    uid Faker::Number.number(10)
    name Faker::Name.name
    nickname Faker::Internet.user_name
    email Faker::Internet.email
    avatar Faker::Internet.url
    links {{ "Github" => 'github.com' }.to_json}
    location Faker::Address.country
  end
end
