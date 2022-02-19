FactoryBot.define do
  factory :request do
    association :fridge
    association :user
  end
end
