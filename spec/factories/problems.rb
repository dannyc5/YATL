FactoryGirl.define do
  factory :problem do
    message { Faker::Lorem.sentence }
  end
end
