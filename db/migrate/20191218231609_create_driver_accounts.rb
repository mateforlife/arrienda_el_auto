class CreateDriverAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :driver_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
