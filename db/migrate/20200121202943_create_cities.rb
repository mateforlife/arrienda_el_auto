class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cities, :name
  end
end
