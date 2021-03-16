class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?
  before_action :set_search
  

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :user_image])
  end
  
  def set_search
    @search = User.ransack(params[:q])
    @results = @search.result.order(id: "DESC")
    
  end
  
end
