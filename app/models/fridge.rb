class Fridge < ApplicationRecord
  has_many :users
  has_many :items
end
