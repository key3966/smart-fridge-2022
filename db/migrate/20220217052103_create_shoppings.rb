class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings do |t|

      t.timestamps
    end
  end
end
