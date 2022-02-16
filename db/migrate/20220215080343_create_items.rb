class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.integer    :regular,     null: false
      t.string     :name,        null: false
      t.integer    :category_id, null: false
      t.integer    :amount_id,   null: false
      t.date       :exp_date
      t.references :fridge,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
