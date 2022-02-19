class Fridge < ApplicationRecord
  has_many :users
  has_many :items
  has_many :requests
end
