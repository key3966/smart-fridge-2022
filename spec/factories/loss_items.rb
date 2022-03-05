FactoryBot.define do
  factory :loss_item do
    loss_date   { Date.today }
    category_id { 1 }
    amount_id   { 3 }
  end
end