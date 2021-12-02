class UsersController < ApplicationController
  #コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, only: [:charm]

  def show
    @user = User.find(params[:id])
    if @user.is_deleted
      redirect_to root_path
    end
  end

  def charm
    #全てのテーマにコメントフォームを持たせるために記述
    @themes = Theme.all
    #ログインしてるユーザーのみコメント
    @user = current_user
    @theme_comment = ThemeComment.new
  end

  # パスワード変更設定
  def edit_password
    @user = User.find(params[:id])
  end

  def follower
    #follower一覧
    user = User.find(params[:user_id])
    @users = user.following_user
        # .follower_userメソッド ：Userモデルで定義済
  end

  def followed
    #followed一覧
    user = User.find(params[:user_id])
    @users = user.follower_user
        # .follower_userメソッド ：Userモデルで定義済
  end

  # 退会機能
  def unsubscribe
    @user = User.find_by(name: params[:name])
  end

  def withdraw
    current_user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  def create
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
