class RenameSexColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :sex, :gender
  end
end
