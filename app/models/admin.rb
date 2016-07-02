class Admin < User
  has_one :admin_info
    
  def sign_in_path
     Rails.application.routes.url_helpers.root_path
  end

  def self.permited_params
   [:type, :email, :password, :password_confirmation, admin_info_attributes: ([:name, :username])]
  end
end