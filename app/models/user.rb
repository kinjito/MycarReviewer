class User < ApplicationRecord
  
    # 1. followメソッド　＝　フォローする
  def follow(user_id)
   follower.create(followed_id: user_id)
  end

  # 2. unfollowメソッド　＝　フォローを外す
  def unfollow(user_id)
   follower.find_by(followed_id: user_id).destroy
  end

  # 3. followingメソッド　＝　既にフォローしているかの確認
  def following?(user)
   following_user.include?(user)
  end

  
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
  
  # フォローしている
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    # フォローされてる
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy


    #フォローしている人
  has_many :follower_user, through: :followed, source: :follower
    #フォローされている人
  has_many :following_user, through: :follower, source: :followed

end
