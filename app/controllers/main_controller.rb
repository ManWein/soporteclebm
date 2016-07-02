class MainController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
  	#redirect_to current_user.sign_in_path
    #render :status => 200, json: { success: current_user.sign_in_path, info: "Login Credentials Failed" }
  	#redirect_to current_user.sign_in_path
    #redirect_to	new_user_registration_path
  end

end