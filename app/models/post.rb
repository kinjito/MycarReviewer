class Post < ApplicationRecord

  #PostモデルにUserモデルを関連付ける
  belongs_to :user
  #画像アップ用のメソッド（attachment）追加、フィールド名（image）指定
  attachment :car_image

end
