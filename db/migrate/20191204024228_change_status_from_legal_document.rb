class ChangeStatusFromLegalDocument < ActiveRecord::Migration[6.0]
  def change
    change_column_default :legal_documents, :status, 0
  end
end
