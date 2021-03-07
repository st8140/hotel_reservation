class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :configure_permitted_parameter, if: :devise_controller?

  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end
end
