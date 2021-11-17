class AddPostidToCarComment < ActiveRecord::Migration[5.2]
  def change
    add_column :car_comments, :post_id, :integer
  end
end
