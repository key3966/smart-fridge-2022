class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :amount
  belongs_to :fridge

  validate :exp_date_check 
  
  with_options presence: true do
    validates :regular
    validates :name
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :amount_id
  end

  private

  def exp_date_check
    if exp_date.present? && exp_date < Date.today
      errors.add(:exp_date, "は今日以降を選択してください")
    end
  end
end
