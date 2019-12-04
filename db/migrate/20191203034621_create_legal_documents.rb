class CreateLegalDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :legal_documents do |t|
      t.integer :document_type
      t.references :resource, polymorphic: true, null: false
      t.date :due_date
      t.integer :status

      t.timestamps
    end
  end
end
