class ShoppingItem < ApplicationRecord
  belongs_to :shopping
  belongs_to :item
end
