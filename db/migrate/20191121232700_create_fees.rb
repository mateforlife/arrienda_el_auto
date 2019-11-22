class CreateFees < ActiveRecord::Migration[6.0]
  def change
    create_table :fees do |t|
      t.string :engine_type
      t.string :body_type
      t.float :amount

      t.timestamps
    end
  end
end
