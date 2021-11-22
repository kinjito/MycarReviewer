class ThemeCommentsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    theme = Theme.find(params[:theme_id])
    comment = ThemeComment.new(theme_comment_params)
    comment.user_id = current_user.id
    comment.theme_id = theme.id
    comment.save
    redirect_to users_charm_path(user)
  end

  def destroy
  end

  private

  def theme_comment_params
    params.require(:theme_comment).permit(:comment_text)
  end
end