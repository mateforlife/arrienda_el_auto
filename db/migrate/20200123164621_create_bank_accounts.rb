class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.references :bank, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name, limit: 40
      t.string :rut, limit: 12
      t.string :account_number
      t.integer :account_type
      t.string :email

      t.timestamps
    end
  end
end
