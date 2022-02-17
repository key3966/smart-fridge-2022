class CreateShoppingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_items do |t|

      t.timestamps
    end
  end
end
