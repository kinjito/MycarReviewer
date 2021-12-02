class Theme < ApplicationRecord
  has_many :theme_comments, dependent: :destroy
    #テーマにthroughを記述することでカラムを持たせることができるので記述した方がいい
  has_many :users, through: :theme_comments
  
  def comment_size
    theme_comments.size
  end
  
  
end
