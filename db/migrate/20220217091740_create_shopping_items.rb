class CreateShoppingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_items, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.references :shopping, null: false, foreign_key: true
      t.references :item,     null: false, foreign_key: true
      t.timestamps 
    end
  end
end
