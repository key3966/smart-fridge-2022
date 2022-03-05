class LossItem
  
  include ActiveModel::Model
  attr_accessor :loss_date, :fridge_id, :item_id, :category_id, :amount_id

  with_options presence: true do
    validates :loss_date
    validates :fridge_id
    validates :item_id
    validates :category_id, numericality: { other_than: 5, message: "is can't be loss"}
    validates :amount_id, numericality: { other_than: 1, message: "is nothing" }
  end

  def save
    Loss.create(loss_date: loss_date, fridge_id: fridge_id, item_id: item_id)
    item = Item.find(item_id)
    item.update(amount_id: 1, exp_date: nil)
  end

end