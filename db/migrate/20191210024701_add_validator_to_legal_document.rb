class AddValidatorToLegalDocument < ActiveRecord::Migration[6.0]
  def change
    add_reference :legal_documents, :validator
  end
end
