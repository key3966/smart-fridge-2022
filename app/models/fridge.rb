class Fridge < ApplicationRecord
  has_many :users
  has_many :items
  has_many :requests
  has_many :shoppings
end
