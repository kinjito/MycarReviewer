class AddColumnsToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :maker_id, :integer
  end
end
