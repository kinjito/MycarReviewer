class PostsController < ApplicationController

  def index
    #投稿内容一覧表示
    # @posts = Post.all
    #検索機能
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    # binding.pry

  end

  def show
    @post = Post.find(params[:id])
    # binding.pry
  end

  def new
    #空のインスタンス変数を渡して表示
    @post = Post.new
  end
  
  # def edit
  #   @post = Post.find(params[:id])
  # end

  def create
    #投稿内容の保存
    @post = Post.new(post_params)
    # binding.pry
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def map
  end

  def destroy
    @post = Post.find(params[:id])
    # binding.pry
    @post.destroy
    redirect_to posts_path
  end

  private
   # 投稿データのストロングパラメータ
  def post_params
    params.require(:post).permit(:car_image, :detail, :car_name, :photo_address, :comment)
  end


end