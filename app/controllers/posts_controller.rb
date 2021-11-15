class PostsController < ApplicationController

  def index
    #投稿内容一覧表示
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    #空のインスタンス変数を渡して表示
    @post = Post.new
  end

  def create
    #投稿内容の保存
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def map
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to new_post_path
  end

  private
   # 投稿データのストロングパラメータ
  def post_params
    params.require(:post).permit(:detail, :car_name, :photo_address, :comment)
  end


end