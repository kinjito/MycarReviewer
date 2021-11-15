class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :car_image
      t.text :detail
      t.string :car_name
      t.text :comment
      t.string :photo_address

      t.timestamps
    end
  end
end
