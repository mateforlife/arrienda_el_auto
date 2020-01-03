class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.datetime :deleted_at
      t.integer :status

      t.timestamps
    end
  end
end
