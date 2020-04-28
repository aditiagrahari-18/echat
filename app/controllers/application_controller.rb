class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  def logged_in_user
      unless user_signed_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :terms_and_conditions])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :password, :password_confirmation, :email, :dob])

  end
end
