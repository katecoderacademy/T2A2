class ApplicationController < ActionController::Base
    # helper_method :current_user
    protect_from_forgery with: :exception, prepend: true
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :instructor, address_attributes: [:address_line_1, :address_line_2, :suburb, :state, :postcode]])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :instructor, address_attributes: [:address_line_1, :address_line_2, :suburb, :state, :postcode]])

    end
  end
    


    
  
