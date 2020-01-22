class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :street, limit: 40
      t.string :street_number, limit: 6
      t.string :apartment, limit: 5

      t.timestamps
    end
  end
end
