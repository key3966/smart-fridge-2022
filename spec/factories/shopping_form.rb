FactoryBot.define do
  factory :shopping_form do
    shopping_date   {Faker::Date.backward}
  end
end