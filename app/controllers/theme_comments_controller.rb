class ThemeCommentsController < ApplicationController

  def create
    comment = ThemeComment.new(theme_comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to users_charm_path(current_user.id)
  end

  def destroy
    ThemeComment.find_by(id: params[:id]).destroy
    redirect_to users_charm_path(params[:current_user_id])
  end
  

  private

  def theme_comment_params
    params.require(:theme_comment).permit(:comment_text, :theme_id)
  end
end