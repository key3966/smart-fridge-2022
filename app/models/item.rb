class Item < ApplicationRecord

  belongs_to :fridge

  with_options presence: true do
    validates :regular
    validates :name
    validates :exp_date
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :amount_id
  end
end
