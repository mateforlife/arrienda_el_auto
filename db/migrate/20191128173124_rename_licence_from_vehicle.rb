class RenameLicenceFromVehicle < ActiveRecord::Migration[6.0]
  def change
    rename_column :vehicles, :licence_plate, :license_plate
  end
end
