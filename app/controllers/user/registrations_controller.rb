class User::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy]
  prepend_before_filter :validate_user_type, only: [:new, :create]  
  before_filter :configure_permitted_parameters, :set_type
​
#  layout :resolve_layout
​
  def r_active_for_auth(resource, resource_name)
    set_flash_message :notice, :signed_up if is_flashing_format?
    sign_up(resource_name, resource)
#    UserMailer.buyer_welcome_email(resource).deliver if params[:type].downcase == "buyer"
    respond_with resource, location: after_sign_up_path_for(resource)
  end
​
  def self.r_not_active_for_auth(resource)
    set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
    expire_data_after_sign_in!
    respond_with resource, location: after_inactive_sign_up_path_for(resource)
  end
​
  def resoruce_not_persisted
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
  end
​
  def validate_user_type
    redirect_to "/" unless valid_type?
  end  
  
  def valid_type?
    ["admin", "analyst", "applicant"].include?(params[:type].downcase)
  end 
​
  def resolve_layout
    params[:type].downcase == "buyer" ? nil : "public_create"
  end
​
  def create
    build_resource(sign_up_params)
​
    resource.save
    yield resource if block_given?
    if resource.persisted?
#      build_contract(resource)
      resource.active_for_authentication? ? r_active_for_auth(resource, resource_name) : r_not_active_for_auth(resource)
    else
      resoruce_not_persisted
    end
  end
​
  # GET /resource/sign_up
  def new
=begin
    session[:current_url] = request.referer
    if @type.downcase=='buyer'
      shopping_cart_id = session[:shopping_cart_id]
      @shopping_cart = ShoppingCart.find_by_id(shopping_cart_id)
      @shopping_cart_items = ShoppingCartItem.where(owner_id: shopping_cart_id)
      @shopping_cart_count = session[:shopping_cart_id] ? ShoppingCartItem.where(owner_id: shopping_cart_id).count : 0
    end
=end
    build_resource({})
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end
​
  protected
​
  def set_type
    @type = params[:type]
  end
​
  def build_resource(hash=nil)
    if @type
      resource_class = @type.capitalize.constantize
      @info = "#{@type.capitalize}Info".constantize.new(hash["#{@type.downcase}_info_attributes".to_sym])
    end
​
    self.resource = resource_class.new_with_session(hash || {}, session)
  end
​
​
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      base_permit(u)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      base_permit(u)
    end
  end
​
  def base_permit(u)
    puts permited_params_for_user(params[:type])
    u.permit(permited_params_for_user(params[:type]))
  end
​
  def permited_params_for_user(type)
    type.constantize.permited_params
  end
​
=begin
  def build_contract(recurso)
    if recurso.type == "Brand"
      recurso.build_brand_contract.save
    end
  end
=end
end