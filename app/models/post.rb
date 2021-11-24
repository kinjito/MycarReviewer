class Post < ApplicationRecord
  belongs_to :maker

  #PostモデルにUserモデルを関連付ける
  belongs_to :user
  #画像アップ用のメソッド（attachment）追加、フィールド名（image）指定
  attachment :car_image
  #PostモデルとCarCommentモデルを関連付ける
  has_many :car_comments, dependent: :destroy

  #いいね機能でPostモデルに関連付けを追加する
  has_many :favorites, dependent: :destroy
  # addressカラムを基準に緯度経度を算出する。
  geocoded_by :photo_address
  #住所変更時に緯度経度も変更する。
  after_validation :geocode

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
