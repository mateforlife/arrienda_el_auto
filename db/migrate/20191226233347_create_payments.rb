class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :reservation, null: false, foreign_key: true
      t.integer :amount
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
