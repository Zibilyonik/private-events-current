class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
    change_column_null :users, :email, false
    change_column_null :users, :name, false
  end
end
