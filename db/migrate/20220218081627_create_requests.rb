class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.references :fridge, null: false, foreign_key: true
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
