class UsersController < ApplicationController
  def new
    @user = User.find(params[:id])
    @theme_comment = Theme_comment.new
  end

  def show
    @user = User.find(params[:id])
    if @user.is_deleted == true
      redirect_to root_path
    end
  end

  def update_password
    @user = User.find(params[:id])
  end
  

  def create
  end
end
