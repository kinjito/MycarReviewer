class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #UserモデルにPostモデルを関連付ける
  has_many :posts, dependent: :destroy
  attachment :image
  #PostモデルとCarCommentモデルを関連付ける
  has_many :car_comments, dependent: :destroy
  #いいね機能のリレーション設定
  has_many :favorites, dependent: :destroy
  
  has_many :theme_comments, dependent: :destroy

end
