class ApplicationController < ActionController::Base
    # helper_method :current_user
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :instructor])
    end
  end
    
    # protect_from_forgery with: :exception
    # before_action :authentication_required
  
    # def authentication_required
    #   redirect_to login_path if !logged_in?
    # end
  
    # def logged_in? 
    #   current_user.present?
    # end
  
    # def current_user
    #     if session[:user_id] 
    #     @current_user ||= User.find(session[:user_id])
    #     else 
    #         @current_user = nil
    # end
    
  
