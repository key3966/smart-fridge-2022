class ShoppingForm

  include ActiveModel::Model
  attr_accessor :shopping_date, :fridge_id, :user_id, :shopping_item_ids

  with_options presence: true do
    validates :shopping_date
    validates :fridge_id
    validates :user_id
    validates :shopping_item_ids
  end

  def save
    ids = shopping_item_ids
    Shopping.create(shopping_date: shopping_date, fridge_id: fridge_id, user_id: user_id, item_ids: ids)
    Item.where(id: ids).update_all(amount_id: 4, exp_date: nil)
  end
end