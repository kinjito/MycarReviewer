class CreateCarComments < ActiveRecord::Migration[5.2]
  def change
    create_table :car_comments do |t|
      t.text :post_comment

      t.timestamps
    end
  end
end
