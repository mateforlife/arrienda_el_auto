class RenameTractionFromVehicles < ActiveRecord::Migration[6.0]
  def change
    rename_column :vehicles, :traction, :drive
  end
end
