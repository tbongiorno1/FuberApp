class AddProfileImageToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :profile_image_id, :string
  end
end
