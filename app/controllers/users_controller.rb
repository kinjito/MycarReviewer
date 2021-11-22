class UsersController < ApplicationController
  #コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!, only: [:charm]

  def show
    @user = User.find(params[:id])
    if @user.is_deleted == true
      redirect_to root_path
    end
  end

  def charm
    # @user = User.find(params[:id])
    @user = current_user
    @theme_comment = ThemeComment.new
  end

  def update_password
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


  def create
  end
  
  

end
