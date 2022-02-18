class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.date       :shopping_date, null: false
      t.references :fridge,        null: false, foreign_key: true
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
