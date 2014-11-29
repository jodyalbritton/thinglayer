class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  	protected
	
 def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :full_name, :time_zone, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :full_name, :email, :password, :password_confirmation, :current_password, :time_zone) }
 end
end
