class AddDriverAccountUniqueToUser < ActiveRecord::Migration[6.0]
  def change
    remove_index :driver_accounts, :user_id
    add_index :driver_accounts, :user_id, unique: true
    change_column_default :driver_accounts, :status, 0
  end
end
