class CreateProfileImages < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_images do |t|
      t.string :type

      t.timestamps
    end
  end
end
