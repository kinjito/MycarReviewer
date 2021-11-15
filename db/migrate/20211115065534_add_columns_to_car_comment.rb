class AddColumnsToCarComment < ActiveRecord::Migration[5.2]
  def change
    add_column :car_comments, :user_id, :integer
    add_column :car_comments, :image_id, :integer
  end
end
