class AddColumnPosts < ActiveRecord::Migration[5.2]
  def change

    add_column :posts, :car_image_filename, :string
    add_column :posts, :car_image_size, :integer
  end
end
