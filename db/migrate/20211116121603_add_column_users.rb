class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    #画像のサイズと名前表示させるカラム
    add_column :users, :image_filename, :string
    add_column :users, :image_size, :integer
  end
end
