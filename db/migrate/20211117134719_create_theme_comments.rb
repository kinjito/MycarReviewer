class CreateThemeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :theme_comments do |t|
      t.references :theme, foreign_key: true
      t.references :user, foreign_key: true

      t.text :comment_text


      t.timestamps
    end
  end
end
