class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :amount
  belongs_to :fridge
  has_many :shopping_items, dependent: :destroy
  has_many :shoppings, through: :shopping_items
  has_many :losses

  #validate :exp_date_check #今は必要かわからないのでコメントアウト 2022/02/17

  with_options presence: true do
    validates :regular
    validates :name
  end

  with_options numericality: { other_than: 0, message: "を選択してください" } do
    validates :category_id
    validates :amount_id
  end

  def latest_shopping_date
    shoppings.order(created_at: :desc).first.shopping_date
  end

  private

  def exp_date_check
    errors.add(:exp_date, 'は今日以降を選択してください') if exp_date.present? && exp_date < Date.today
  end
end
