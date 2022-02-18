class Shopping < ApplicationRecord
  belongs_to :fridge
  belongs_to :user
  has_many :shopping_items
  has_many :items, through: :shopping_items
end
