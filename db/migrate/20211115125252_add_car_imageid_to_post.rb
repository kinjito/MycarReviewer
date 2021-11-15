class AddCarImageidToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :car_image_id, :string
  end
end
