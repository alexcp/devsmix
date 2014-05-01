FactoryGirl.define do
  factory :user do
    id 10
    uid Faker::Number.number(10)
    name Faker::Name.name
    nickname Faker::Internet.user_name
    email Faker::Internet.email
    avatar Faker::Internet.url
    links {{ "Github" => 'github.com' }.to_json}
    location Faker::Address.country
  end

  factory :playlist do
    name Faker::Name.name
    user_id 10
    cover Faker::Internet.url
  end
end
