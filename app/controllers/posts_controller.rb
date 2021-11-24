class PostsController < ApplicationController

  def index
    #投稿内容一覧表示
    # @posts = Post.all
    #検索機能
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).reverse_order

  end

  def show
    @post = Post.find(params[:id])
    #コメント機能追加
    @car_comment = CarComment.new
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

    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def map
    @post = Post.last
    #postの一番最新のぶんをとってる
    # gon.user = @post # 追記
    @posts = Post.all
    gon.users = @posts
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private
   # 投稿データのストロングパラメータ
  def post_params
    params.require(:post).permit(:car_image, :detail, :car_name, :photo_address, :comment, :maker_id)
  end

end