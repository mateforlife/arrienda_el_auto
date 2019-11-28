class RenameDirectionFromVehicles < ActiveRecord::Migration[6.0]
  def change
    rename_column :vehicles, :direction, :steering
  end
end
