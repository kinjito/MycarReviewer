class PostsController < ApplicationController

  def index
    #検索機能
    @q = Post.ransack(params[:q])
    #投稿内容一覧表示
    @posts = @q.result(distinct: true).page(params[:page]).reverse_order.per(6)
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

  def edit
    @post = Post.find_by(id: params[:id])

  end

  def create
    #投稿内容の保存
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def map
    @post = Post.last
    #postの一番最新の情報をとってくる
    @posts = Post.all
    gon.users = @posts
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
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