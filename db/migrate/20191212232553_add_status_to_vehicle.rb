class AddStatusToVehicle < ActiveRecord::Migration[6.0]
  def change
    remove_column :vehicles, :visible, :boolean
    add_column :vehicles, :status, :integer, default: 0
  end
end
