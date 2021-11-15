class RemoveCarImageFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :car_image, :string
  end
end
