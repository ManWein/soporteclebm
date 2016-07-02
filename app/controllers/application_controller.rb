class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception






  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def record_not_found
    render  :status => 404,
            :json => { :success => false,
                       :info => "The record is not registered."
            }
  end
​
  def after_sign_in_path_for(resource)
 #   unless current_user.nil?
 #     current_user.type.nil? ? "" : ((current_user.type == 'Buyer') ? "" : current_user.check_profile_info)
 #   end
    resource.sign_in_path
  end
  
  def validate_confirmation
    valid = current_user.validate_email(params[:code])
    valid ? (redirect_to action: 'update_info') : (redirect_to  "/")
  end
  
​
  protected
​
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
​
  def check_confirm
    redirect_to action: 'confirmation' unless current_user.confirmed_code?
  end
​
  def check_contract
    if current_user.brand?
      render 'brands/active_contract', layout: 'public_create_confirm' unless current_user.active_contract?
    end
  end
​
end