class CreateLosses < ActiveRecord::Migration[6.0]
  def change
    create_table :losses, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.date       :loss_date, null: false
      t.references :fridge,    null: false, foreign_key: true
      t.references :item,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
