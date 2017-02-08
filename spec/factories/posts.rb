FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body_textile { Faker::Lorem.paragraph }
  end
end
