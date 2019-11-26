class CreateUserProfileImages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profile_images do |t|

      t.timestamps
    end
  end
end
