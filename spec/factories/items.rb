FactoryBot.define do
  factory :item do
    regular          { Faker::Number.between(from: 0, to: 1) }
    name             { Faker::Lorem.word }
    category_id      { Faker::Number.between(from: 1, to: 3) }
    amount_id        { Faker::Number.between(from: 1, to: 4) }
    exp_date         { Faker::Date.forward }
    association :fridge
  end
end
