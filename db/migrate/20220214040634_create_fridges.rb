class CreateFridges < ActiveRecord::Migration[6.0]
  def change
    create_table :fridges, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.string :title
      t.timestamps
    end
  end
end
