class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.text :theme_text

      t.timestamps
    end
  end
end
