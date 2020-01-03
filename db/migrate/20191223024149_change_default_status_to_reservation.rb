class ChangeDefaultStatusToReservation < ActiveRecord::Migration[6.0]
  def change
    change_column_default :reservations, :status, 0
  end
end
