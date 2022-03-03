class LossItems
  include ActiveModel::Model
  attr_accessor :loss_date, :fridge_id, :item_id

  def save
    Loss.create(loss_date: loss_date, fridge_id: fridge_id, item_id: item_id)
    item = Item.find(id: item_id)
    item.update(amount_id: 1, exp_date: nil)
  end

end