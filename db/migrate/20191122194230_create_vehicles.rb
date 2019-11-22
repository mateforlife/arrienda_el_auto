class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_model, null: false, foreign_key: true
      t.string :year
      t.integer :odometer
      t.references :user, null: false, foreign_key: true
      t.string :licence_plate
      t.string :ngine_number
      t.string :chasis_number
      t.integer :transmission
      t.integer :engine_type
      t.integer :passenger_capacity
      t.boolean :air_conditioning
      t.integer :airbags_quantity
      t.integer :door_quantity
      t.integer :traction
      t.integer :direction
      t.integer :body_type
      t.boolean :visible
      t.references :fee, null: false, foreign_key: true
      t.text :comment
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
