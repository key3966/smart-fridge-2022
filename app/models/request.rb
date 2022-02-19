class Request < ApplicationRecord
  belongs_to :fridge
  belongs_to :user

  with_options presence: true do
    validates :fridge_id
    validates :user_id
  end
end
