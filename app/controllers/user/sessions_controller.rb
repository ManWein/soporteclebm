class User::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, only: [:new, :create]
  skip_before_filter :verify_signed_out_user, only: :destroy
  prepend_before_filter :allow_params_authentication!, only: :create
  prepend_before_filter only: [:create, :destroy] { request.env["devise.skip_timeout"] = true }

  layout "public"

  respond_to :json, :html

  def new
    #if params[:type] == "buyer"
    #  redirect_to "/users/register/buyer" if params[:type] == "buyer"
    #else
    session_response_bb
    #end
  end
  
  def session_response_bb
    #@bloggers = AboutBlogger.select_four
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end
  
  def set_resource(request)
    if request.headers["X-Blogger-Token"]
      token = Token.find_by_token(request.headers["X-Blogger-Token"])
      self.resource = token.blogger if token
    else
      self.resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
    end
  end  

  def create
    #if params[:user] && params[:user][:blogger_id]
    #  @user = User.find_by_id(params[:user][:blogger_id])
    #  return failure unless (params[:user][:login] == @user.email)
    #end
    #set_resource(request)
    if self.resource
      render_if_resoruce
    else
      render :status => 200, :json => { :success => false, :info => "Unknow user", :user => nil }
    end
  end
  
  def render_if_resoruce
    if sign_in(resource_name, resource)
      respond_to do |format|
        format.json { render :status => 200, :json => { :success => true, :info => "Logged in", :user => UserSerializer.new(resource).serializable_hash}, :callback => params[:callback] }
        format.html { respond_with resource, location: after_sign_in_path_for(resource) }
      end
    else
      render :status => 200, :json => { :success => false, :info => "Login failed", :user => nil }
    end  
  end  

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
    yield if block_given?
    respond_to_on_destroy
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Credentials Failed" }
  end

  def show_current_user
    warden.authenticate!(failed_auth_options)
    render :status => 200,
           :json => { :success => true,
                      :info => "Current User",
                      :user => UserSerializer.new(current_user).serializable_hash }
  end

  def failed_auth_options
    { :scope => resource_name, :recall => "#{controller_path}#failure" }
  end
end