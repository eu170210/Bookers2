class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception




  before_action :set_current_user

def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email]
    devise_parameter_sanitizer.permit :account_update, keys: [:name]
    devise_parameter_sanitizer.permit :sign_in, keys: [:name]
  end


def after_sign_in_path_for(resource)
    books_path # ログイン後に遷移するpathを設定
  end
end
