class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_filename, :string
    add_column :users, :image_size, :integer
  end
end
