class CreateBodyworks < ActiveRecord::Migration[6.0]
  def change
    create_table :bodyworks do |t|
      t.string :name

      t.timestamps
    end
  end
end
