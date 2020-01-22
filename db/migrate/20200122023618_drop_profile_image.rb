class DropProfileImage < ActiveRecord::Migration[6.0]
  def change
    drop_table :profile_images
  end
end
