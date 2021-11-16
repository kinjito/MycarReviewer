class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    posts_path(resource)
  end

  protected
  #名前でログインするため
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :self_introduction, :image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    #マイページ編集で既存のカラム以外を保存したい場合
    devise_parameter_sanitizer.permit(:account_update, keys: [:self_introduction, :image, :email])
  end

end
