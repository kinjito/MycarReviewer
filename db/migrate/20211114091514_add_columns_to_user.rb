class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    #userで足りないカラムの
    add_column :users, :self_introduction, :string
    add_column :users, :image_id, :string
    add_column :users, :is_deleted, :boolean

  end
end
