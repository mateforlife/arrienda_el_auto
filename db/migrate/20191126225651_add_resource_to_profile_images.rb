class AddResourceToProfileImages < ActiveRecord::Migration[6.0]
  def change
    add_reference(:profile_images, :resource, {:polymorphic=>true})
  end
end
