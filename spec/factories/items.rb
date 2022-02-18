FactoryBot.define do
  factory :item do
    regular          { Faker::Number.between(from: 0, to: 1) }
    name             { Faker::Lorem.word }
    category_id      { Category.where.not(id: 0).sample.id }
    amount_id        { Amount.where.not(id: 0).sample.id }
    exp_date         { Faker::Date.forward }
    association :fridge
  end
end
