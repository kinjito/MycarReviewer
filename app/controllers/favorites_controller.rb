class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    #非同期だと＠postが適用されなかったので、記載
    current_user.save_with(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

end
