class CarCommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = CarComment.new(car_comment_params)
    comment.user_id = current_user.id
    
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
  end
  
  private

  def car_comment_params
    params.require(:car_comment).permit(:post_comment)
  end
end
