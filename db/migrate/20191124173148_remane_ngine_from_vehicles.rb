class RemaneNgineFromVehicles < ActiveRecord::Migration[6.0]
  def change
    rename_column :vehicles, :ngine_number, :engine_number
  end
end
